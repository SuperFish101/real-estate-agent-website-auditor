#!/bin/sh
# verify-citations.sh
#
# Checks that this auditor's citations are real. No dependencies beyond a POSIX shell,
# grep and awk. Nothing is downloaded and nothing is written.
#
#   ./verify-citations.sh          run every check
#   ./verify-citations.sh -v       also print each citation as it is checked
#
# Six checks:
#   1. Every provision ID cited anywhere exists in reference/
#   2. Every "reference/file.md:line" pointer lands on the line carrying that provision
#   3. Every sample pointer names a file and line that exist
#   4. Every reference file declares its publisher, source and retrieval date
#   5. Every internal markdown link points at a file that exists
#   6. The files that load on every run stay under their ICM size caps
#
# Exit 1 means at least one citation is wrong. A wrong citation is a defect in the auditor,
# not in the artifact it audits.

set -u
cd "$(dirname "$0")" || exit 1

VERBOSE=0
[ "${1:-}" = "-v" ] && VERBOSE=1

fail=0
checked=0

say() { [ "$VERBOSE" -eq 1 ] && echo "    $*"; return 0; }
bad() { echo "FAIL  $*"; fail=$((fail + 1)); }

DOCS="CLAUDE.md CONTEXT.md identity.md rules.md examples.md README.md $(ls method/*.md stages/*/CONTEXT.md output/*/*.md samples/README.md 2>/dev/null)"
# Every provision ID family registered in reference/README.md. A family missing from this
# pattern is a family nobody checks, so add the row and the pattern in the same change.
IDPAT='(GSE-TR-[A-Z0-9-]+|SPAM-[A-Z-]+|SD-GEN-[A-Z]+-[0-9]+|SD-LB-[A-Za-z-]+|WCAG-[0-9.]+[0-9]|WCAG-CONFORMANCE-[0-9.]+[0-9]|CA-10140\.8\([ab]\)\([12]\)(-[A-Z]+)?|CA-2773\([abc]\)(\([0-9]\))?(-[A-Z]+)?|CALOPPA-22575\([a-z]\)(-[A-Z]+)?|FHA-100\.75\([a-z]\)(\([0-9]\))?|TCPA-64\.1200\([f0-9]\)(\([0-9]\))?(\([i]+\)\([A-Z]\))?(-[A-Z]+)?|LINK-REL-[A-Za-z]+|BING-[A-Z0-9-]+|AICRAWL-[A-Za-z-]+|SM-[A-Z]+-[A-Za-z0-9]+|INDEXNOW-[A-Z]+-[0-9]+|HSTS-[0-9.]+[0-9]|FHA-109\.20-RESCINDED-\([a-f]\)|RFC9309-[0-9.]+[0-9])'

echo "== 1. Every cited provision ID exists somewhere in reference/"
for id in $(grep -hoE "$IDPAT" $DOCS 2>/dev/null | sort -u); do
  checked=$((checked + 1))
  if grep -rqF -- "$id" reference/; then
    say "ok   $id"
  else
    bad "provision '$id' is cited but does not exist anywhere in reference/"
  fi
done
echo "    $checked distinct provision IDs checked"

echo "== 2. Every reference pointer lands on the line carrying that provision"
# A pointer looks like (reference/path/file.md:87). The provision ID it belongs to is the
# last ID appearing on that line or the two lines above it.
AWKIDPAT='(GSE-TR-[A-Z0-9-]+|SPAM-[A-Z-]+|SD-GEN-[A-Z]+-[0-9]+|SD-LB-[A-Za-z-]+|WCAG-CONFORMANCE-[0-9.]+[0-9]|WCAG-[0-9.]+[0-9]|CA-10140\\.8\\([ab]\\)\\([12]\\)(-[A-Z]+)?|CA-2773\\([abc]\\)(\\([0-9]\\))?(-[A-Z]+)?|CALOPPA-22575\\([a-z]\\)(-[A-Z]+)?|FHA-100\\.75\\([a-z]\\)(\\([0-9]\\))?|TCPA-64\\.1200\\([f0-9]\\)(\\([0-9]\\))?(\\([i]+\\)\\([A-Z]\\))?(-[A-Z]+)?|LINK-REL-[A-Za-z]+|BING-[A-Z0-9-]+|AICRAWL-[A-Za-z-]+|SM-[A-Z]+-[A-Za-z0-9]+|INDEXNOW-[A-Z]+-[0-9]+|HSTS-[0-9.]+[0-9]|FHA-109\\.20-RESCINDED-\\([a-f]\\)|RFC9309-[0-9.]+[0-9])'
awk -v idpat="$AWKIDPAT" '
  { for (i = 3; i > 1; i--) prev[i] = prev[i-1]; prev[1] = $0 }
  /reference\/[A-Za-z0-9._\/-]+\.md:[0-9]+/ {
    line = $0
    while (match(line, /reference\/[A-Za-z0-9._\/-]+\.md:[0-9]+/)) {
      ptr = substr(line, RSTART, RLENGTH)
      line = substr(line, RSTART + RLENGTH)
      id = ""
      for (i = 1; i <= 3; i++) {
        s = prev[i]
        while (match(s, idpat)) { id = substr(s, RSTART, RLENGTH); s = substr(s, RSTART + RLENGTH) }
        if (id != "") break
      }
      print FILENAME "\t" FNR "\t" ptr "\t" id
    }
  }
' $DOCS > /tmp/vc_ptrs.$$ 2>/dev/null

n=0
while IFS="$(printf '\t')" read -r src srcline ptr id; do
  n=$((n + 1))
  file=${ptr%:*}
  ln=${ptr##*:}
  if [ ! -f "$file" ]; then
    bad "$src:$srcline points at '$file', which does not exist"
    continue
  fi
  if [ -z "$id" ]; then
    bad "$src:$srcline has pointer '$ptr' with no provision ID near it"
    continue
  fi
  total=$(wc -l < "$file")
  if [ "$ln" -gt "$total" ]; then
    bad "$src:$srcline points at $file:$ln but that file has only $total lines"
    continue
  fi
  if sed -n "${ln}p" "$file" | grep -qF -- "$id"; then
    say "ok   $id -> $ptr"
  else
    bad "$src:$srcline cites $id at $ptr, but line $ln of $file does not contain '$id'"
    echo "        line $ln reads: $(sed -n "${ln}p" "$file" | cut -c1-90)"
  fi
done < /tmp/vc_ptrs.$$
rm -f /tmp/vc_ptrs.$$
echo "    $n reference pointers checked"

echo "== 3. Every sample pointer names a file and line that exist"
m=0
for ptr in $(grep -hoE 'samples/[A-Za-z0-9._/-]+:[0-9]+(-[0-9]+)?' $DOCS 2>/dev/null | sort -u); do
  m=$((m + 1))
  file=${ptr%:*}
  range=${ptr##*:}
  last=${range##*-}
  if [ ! -f "$file" ]; then
    bad "sample pointer '$ptr' names a file that does not exist"
    continue
  fi
  total=$(wc -l < "$file")
  if [ "$last" -gt "$total" ]; then
    bad "sample pointer '$ptr' exceeds $file, which has $total lines"
  else
    say "ok   $ptr"
  fi
done
echo "    $m sample pointers checked"

echo "== 4. Every reference file declares its provenance"
k=0
for f in $(find reference -name '*.md' ! -name 'README.md' ! -name 'CONTEXT.md' ! -name 'POINTERS.md' ! -name '_TEMPLATE.md'); do
  k=$((k + 1))
  if grep -q '^| Source |' "$f" && grep -q '^| Retrieved |' "$f" && grep -q '^| Publisher |' "$f"; then
    say "ok   $f"
  else
    bad "$f is missing a Publisher, Source or Retrieved row in its provenance table"
  fi
done
echo "    $k reference files checked"

echo "== 5. Every internal link points at a file that exists"
j=0
for f in $(find . -name '*.md' -not -path './reference/*'); do
  d=$(dirname "$f")
  for l in $(grep -oE '\]\([^)#][^)]*\.(md|sh)\)' "$f" 2>/dev/null | sed 's/^](//;s/)$//'); do
    j=$((j + 1))
    if [ -e "$d/$l" ]; then
      say "ok   $f -> $l"
    else
      bad "$f links to '$l', which does not exist"
    fi
  done
done
echo "    $j internal links checked"

echo "== 6. The contract stays small enough to load every run"
# ICM size caps. reference/ is exempt: it holds other people's documents, kept whole.
for pair in "rules.md:210" "identity.md:100" "CLAUDE.md:80" "CONTEXT.md:80" "reference/README.md:80" $(for c in stages/*/CONTEXT.md; do echo "$c:80"; done); do
  f=${pair%:*}; cap=${pair##*:}
  n=$(wc -l < "$f" | tr -d ' ')
  if [ "$n" -le "$cap" ]; then
    say "ok   $f is $n lines, cap $cap"
  else
    bad "$f is $n lines, over its $cap line cap. Move a lookup into method/ and point at it"
  fi
done
echo "    $(( 5 + $(ls -d stages/*/ 2>/dev/null | wc -l | tr -d ' ') )) size caps checked"

echo "== 7. The stage map matches the stage folders"
# A renumber that edits the folders but not the prose leaves the map lying. Two invariants:
# (a) every stages/NN-slug/ path written in any doc points at a real folder, and
# (b) the folders themselves are a contiguous run 01..N with no gap and no repeat.
stagerefs=0
for ref in $(grep -rhoE 'stages/[0-9]{2}-[a-z-]+' $DOCS 2>/dev/null | sort -u); do
  stagerefs=$((stagerefs + 1))
  if [ ! -d "$ref" ]; then
    bad "doc references '$ref' but no such stage folder exists (renumber left the map lying)"
  fi
done
nums=$(ls -d stages/*/ 2>/dev/null | grep -oE '/[0-9]{2}-' | tr -dc '0-9\n' | sort)
expected=1
for n in $nums; do
  got=$((10#$n))
  if [ "$got" -ne "$expected" ]; then
    bad "stage folders are not contiguous: expected $(printf '%02d' "$expected"), found $(printf '%02d' "$got"). A renumber skipped or duplicated a number"
    break
  fi
  expected=$((expected + 1))
done
echo "    $stagerefs stage-path references checked against $(ls -d stages/*/ 2>/dev/null | wc -l | tr -d ' ') folders"

echo
if [ "$fail" -eq 0 ]; then
  echo "PASS. Every citation resolves."
  exit 0
else
  echo "$fail broken citation(s). Fix these before trusting any audit this folder produces."
  exit 1
fi
