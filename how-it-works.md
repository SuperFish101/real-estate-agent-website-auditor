# How the auditor works

One picture of the whole run. You give it a website, it gives you two reports.

The diagram below is Mermaid, so it renders in VS Code's preview, on GitHub, and in Notion.
If you need a flat image instead, `how-it-works.png` beside this file is the same picture.

## The pipeline

```mermaid
flowchart TD
    A["An agent's website<br/>(files, or a live URL)"] --> B

    subgraph GATES ["Two gates. Both must pass."]
        direction TB
        B["01 · Freshness<br/>Are our rules still<br/>the real rules?"] --> C["02 · Jurisdiction<br/>Which state's law<br/>applies?"]
    end

    C --> D["03 · Inventory<br/>What is actually<br/>on this site?"]
    D --> CHECKS

    subgraph CHECKS ["Ten checks. Independent of each other."]
        direction LR
        E["04 · Can Google<br/>index it"]
        F["05 · Can each<br/>crawler read it"]
        G["06 · Is the markup<br/>honest"]
        H["07 · WCAG 2.1 AA"]
        I["08 · Spam policies"]
        J["09 · Licence and<br/>broker shown"]
        K["10 · Altered photos<br/>disclosed"]
        L["11 · Fair housing<br/>wording"]
        M["12 · Privacy and<br/>form consent"]
        N["13 · Links work, paid<br/>ones declared"]
        E ~~~ J
        F ~~~ K
        G ~~~ L
        H ~~~ M
        I ~~~ N
    end

    CHECKS --> O["14 · Report<br/>Assembles what<br/>the checks found"]

    O --> P["Client report<br/>plain English"]
    O --> Q["Fix list<br/>file, line, citation"]
```

## What the picture is saying

**The gates run first, and they can stop the whole thing.** Stage 01 checks that every standard
we vendored is still the live version. Stage 02 asks which state the agent works in and loads
that state's pack. An auditor that confidently enforces a dead rule is worse than no auditor.

**The ten checks do not talk to each other.** Each one owns exactly one standard and can only
issue its own kind of verdict. That is why a bad result in one place cannot quietly bend the
result somewhere else.

**Three of the checks read the state pack, not a fixed law.** Stages 09, 10 and 12 enforce
whatever stage 02 loaded. Load California and they enforce California. Load another state and
California is never mentioned.

**Stage 11 issues no verdict at all.** Fair housing wording gets surfaced and quoted, never
graded.
