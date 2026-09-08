#!/bin/sh
# check-standards-freshness.sh
#
# Standards change. Two of them changed under this repo while it was being built:
#   - 24 CFR part 109 (fair housing advertising) was REMOVED from the eCFR on 2020-10-26.
#     Most real estate advertising guides on the web still cite it. Its URL now 404s.
#   - RFC 7489 (DMARC) was OBSOLETED in May 2026 by RFC 9989, 9990 and 9991. Most DMARC
#     guides still cite 7489.
#
# An auditor that quietly enforces a dead rule is worse than no auditor, because it is
# confidently wrong. This script is the guard.
#
# For every vendored standard it does two things:
#   1. Fetches the source URL and checks the status. A non-200 is how a withdrawn document
#      announces itself.
#   2. Greps the live page for a "canary": an exact phrase taken from our vendored copy. If
#      the canary is gone, the publisher changed the text and our copy is stale.
#
#   ./check-standards-freshness.sh          check everything
#   ./check-standards-freshness.sh -q       only print problems
#
# Needs curl and nothing else. Run it before any audit you are going to hand to a client,
# and at minimum monthly. It is the only part of this repo that touches the network.

set -u
cd "$(dirname "$0")" || exit 1

QUIET=0
[ "${1:-}" = "-q" ] && QUIET=1

ok=0; stale=0; gone=0; unreachable=0
byhand=0
rescinded=0; blocked=0
UA='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'

say() { [ "$QUIET" -eq 0 ] && echo "$@"; return 0; }

say "Checking every standard in reference/ against its live source."
say ""

while IFS="$(printf '\t')" read -r file url retrieved canary; do
  case "$file" in \#*|'') continue ;; esac
  [ -f "reference/$file" ] || { echo "MISSING   reference/$file is listed in SOURCES.tsv but does not exist"; gone=$((gone+1)); continue; }

  # Two canaries are sentinels, not phrases. Some sources cannot be checked this way at all,
  # and pretending otherwise produces a permanent false STALE that trains you to ignore the
  # script. Better to name the reason.
  case "$canary" in
    RENDERED:*)
      echo "BY HAND      $file"
      echo "             $url is a JavaScript application and returns no text to curl."
      echo "             Open it in a browser and check by hand: ${canary#RENDERED:}"
      byhand=$((byhand+1))
      continue ;;
    RESCINDED:*)
      say "RESCINDED    $file  (no live source by design: ${canary#RESCINDED:})"
      rescinded=$((rescinded+1))
      continue ;;
  esac

  body=$(curl -sS -L --max-time 45 -A "$UA" -w '\n__STATUS__%{http_code}' "$url" 2>/dev/null)
  status=$(printf '%s' "$body" | tail -1 | sed 's/^__STATUS__//')
  page=$(printf '%s' "$body" | sed '$d')

  if [ -z "$status" ] || [ "$status" = "000" ]; then
    echo "UNREACHABLE  $file"
    echo "             could not fetch $url. Network, or the host is blocking. Re-run before acting"
    unreachable=$((unreachable+1))
    continue
  fi

  case "$status" in
    403|429|503)
      echo "BLOCKED      $file"
      echo "             $url returned HTTP $status. That is bot blocking, NOT withdrawal."
      echo "             W3C and some publishers refuse plain curl. Open the URL in a browser"
      echo "             and check the canary by hand:"
      echo "             \"$canary\""
      blocked=$((blocked+1))
      continue
      ;;
    404|410)
      echo "WITHDRAWN?   $file"
      echo "             $url returned HTTP $status"
      echo "             A document that stops resolving may have been rescinded. Check before"
      echo "             citing this standard again. This is exactly how 24 CFR 109 died."
      gone=$((gone+1))
      continue
      ;;
    200) ;;
    *)
      echo "UNEXPECTED   $file returned HTTP $status from $url. Check by hand."
      unreachable=$((unreachable+1))
      continue
      ;;
  esac

  # Normalise before matching. Strip tags, collapse all whitespace to single spaces, and do
  # the same to the canary. Without this, every line-wrapped phrase is a false positive.
  flat=$(printf '%s' "$page" | sed -e 's/<[^>]*>/ /g' -e "s/&nbsp;/ /g" -e 's/&amp;/\&/g' -e 's/&quot;/"/g' -e "s/&#8220;/\"/g" -e "s/&#8221;/\"/g" | tr '\n\r\t' '   ' | tr -s ' ')
  flatcanary=$(printf '%s' "$canary" | tr '\n\r\t' '   ' | tr -s ' ')

  if printf '%s' "$flat" | grep -qF -- "$flatcanary"; then
    say "CURRENT      $file  (retrieved $retrieved)"
    ok=$((ok+1))
  else
    echo "STALE        $file"
    echo "             $url still returns 200, but our canary phrase is no longer on the page:"
    echo "             \"$canary\""
    echo "             Either the publisher changed the text, or the page needs JavaScript to"
    echo "             render (leginfo.legislature.ca.gov does). Open it in a browser first."
    echo "             If the text really changed: re-vendor this file and re-check"
    echo "             every finding that cites it."
    stale=$((stale+1))
  fi
done < reference/SOURCES.tsv

echo ""
echo "current: $ok   stale: $stale   withdrawn: $gone   blocked, check by hand: $((blocked + byhand))   rescinded by design: $rescinded   unreachable: $unreachable"
if [ "$stale" -gt 0 ] || [ "$gone" -gt 0 ]; then
  echo ""
  echo "Do not hand a client an audit built on a stale standard. Re-vendor first."
  exit 1
fi
exit 0
