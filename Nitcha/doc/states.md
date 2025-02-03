### Legend
- (M) move keys
- (K) kneel key
- (S) sleep key
- (B) block key
- ?R? recover ?
---
````mermaid
flowchart TB
    WOUND(Wound)
    SLEEP(Sleep)
    KNEEL(Kneel)
    STAND(Stand)
    BLOCK(Block)
    SHIFT((Shift))

    WOUND-.?R?.->SLEEP

    SLEEP-.(K).->KNEEL
    SLEEP-.(S)|(M).->STAND

    KNEEL-.(K).->STAND
    KNEEL-.(S).->SLEEP
    KNEEL-.(B).->BLOCK
    KNEEL-.(M).->SHIFT

    STAND-.(K).->KNEEL
    STAND-.(S).->SLEEP
    STAND-.(B).->BLOCK
    STAND-.(M).->SHIFT

    BLOCK-.(K).->KNEEL
    BLOCK-.(B).->STAND
    BLOCK-.(S).->SLEEP

    SHIFT-.(M).->SHIFT
````
