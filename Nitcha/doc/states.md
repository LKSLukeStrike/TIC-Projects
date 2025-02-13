### Legend
- (M) move keys
- (K) kneel key
- (S) sleep key
- (B) block key
- ?R? recover ?
---
````mermaid
flowchart TB
    ssi(STANDIDLE)
    ssw(STANDWORK)
    ssm(STANDMOVE)
    ski(KNEELIDLE)
    skw(KNEELWORK)
    skm(KNEELMOVE)
    sds(DOWNSLEEP)

    ssi--(K)-->ski
    ski--(K)-->ssi
    ssi--(S)-->sds
    ski--(S)-->sds

    ssl<--(M)-->ssr
    ssl--(M)-->sml
    sml--(I)-->ssl
    ssr--(M)-->smr
    smr--(I)-->ssr
    ksl<--(M)-->ksr

    ksl--(M)-->kml
    kml--(I)-->ksl
    ksr--(M)-->kmr
    kmr--(I)-->ksr
    ssl<--(K)-->ksl
    ssr<--(K)-->ksr
````
---
````mermaid
%% flowchart TB
%%     WOUND(Wound)
%%     SLEEP(Sleep)
%%     KNEEL(Kneel)
%%     STAND(Stand)
%%     BLOCK(Block)
%%     SHIFT((Shift))

%%     WOUND-.?R?.->SLEEP

%%     SLEEP-.(K).->KNEEL
%%     SLEEP-.(S)|(M).->STAND

%%     KNEEL-.(K).->STAND
%%     KNEEL-.(S).->SLEEP
%%     KNEEL-.(B).->BLOCK
%%     KNEEL-.(M).->SHIFT

%%     STAND-.(K).->KNEEL
%%     STAND-.(S).->SLEEP
%%     STAND-.(B).->BLOCK
%%     STAND-.(M).->SHIFT

%%     BLOCK-.(K).->KNEEL
%%     BLOCK-.(B).->STAND
%%     BLOCK-.(S).->SLEEP

%%     SHIFT-.(M).->SHIFT
````
---
````mermaid
flowchart TB
    KI0(Kneel Idle 0)
    KI1(Kneel Idle 1)
    KW0(Kneel Work 0)
    KW1(Kneel Work 1)
    KM0(Kneel Mpve 0)
    KM1(Kneel Mpve 1)

    %% keep state
    KII{I}
    KMM{M}
    KWW{W}
    %% idle <> move
    KIM{M}
    KMI{I}
    %% idle <> work
    KIW{W}
    KWI{I}
    %% move <> work
    KMW{W}
    KWM{M}

    %% loop idle -- depend on stress
    KI0-.->KII
    KII-.->KI0
    KI1-.->KII
    KII-.->KI1

    %% loop move -- while moving
    KM0-.->KMM
    KMM-.->KM0
    KM1-.->KMM
    KMM-.->KM1

    %% loop work -- until work is done or move
    KW0<-.->KWW
    KWW<-.->KW0
    KW1<-.->KWW
    KWW<-.->KW1

    %% idle to move
    KI0-.->KIM
    KI1-.->KIM
    KIM-.->KM0

    %% move to idle
    KM0-.->KMI
    KM1-.->KMI
    KMI-.->KI0
    KMI-.->KI1

    %% idle to work
    KI0-.->KIW
    KI1-.->KIW
    KIW-.->KW0

    %% work to idle
    KW0-.->KWI
    KW1-.->KWI
    KWI-.->KI0
    KWI-.->KI1

    %% move to work
    KM0-.->KMW
    KM1-.->KMW
    KMW-.->KW0

    %% work to move
    KW0-.->KWM
    KW1-.->KWM
    KWM-.->KM0
    KWM-.->KM1

````
