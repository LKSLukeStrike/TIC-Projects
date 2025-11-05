ScreenWorld = CScreen{name = "ScreenWorld", keysfunctions = Tic.KEYSFUNCTIONSWORLD}

-- lf panel
ScreenWorldLF = CScreen{name = "ScreenWorldLF"}

WindowPlayerInfos    = CWindowPlayerInfos{}
ButtonPlayerPrev     = CButtonPlayerPrev{}
ButtonPlayerPick     = CButtonPlayerPick{}
ButtonPlayerNext     = CButtonPlayerNext{}
ScreenWorldLF:elementsDistributeH(
    {ButtonPlayerPrev, ButtonPlayerPick, ButtonPlayerNext},
    WindowPlayerInfos.screenx + (
        (WindowPlayerInfos.screenw - CScreen:elementsTotalW({ButtonPlayerPrev, ButtonPlayerPick, ButtonPlayerNext})) // 2),
    WindowPlayerInfos.screeny - Tic.SPRITESIZE - 1
)

WindowPlayerPortrait = CWindowPlayerPortrait{}
ButtonPlayerMove000    = CButtonPlayerMove000{}
ButtonPlayerMove045    = CButtonPlayerMove045{}
ButtonPlayerMove090    = CButtonPlayerMove090{}
ButtonPlayerMove135    = CButtonPlayerMove135{}
ButtonPlayerMove180    = CButtonPlayerMove180{}
ButtonPlayerMove225    = CButtonPlayerMove225{}
ButtonPlayerMove270    = CButtonPlayerMove270{}
ButtonPlayerMove315    = CButtonPlayerMove315{}
ButtonPlayerSlotHead   = CButtonPlayerSlotHead{}
ButtonPlayerSlotBack   = CButtonPlayerSlotBack{}
ButtonPlayerSlotHandLF = CButtonPlayerSlotHandLF{}
ButtonPlayerSlotHandRG = CButtonPlayerSlotHandRG{}
ScreenWorldLF:elementsDistributeH( -- up h line
    {ButtonPlayerMove315, ButtonPlayerMove045},
    WindowPlayerPortrait.screenx - 6,
    WindowPlayerPortrait.screeny - Tic.SPRITESIZE + 2,
    12
)
ScreenWorldLF:elementsDistributeH( -- md h line
    {ButtonPlayerMove270, ButtonPlayerMove090},
    WindowPlayerPortrait.screenx - 7,
    WindowPlayerPortrait.screeny + 4,
    14
)
ScreenWorldLF:elementsDistributeH( -- dw h line
    {ButtonPlayerMove225, ButtonPlayerMove135},
    WindowPlayerPortrait.screenx - 6,
    WindowPlayerPortrait.screeny + WindowPlayerPortrait.screenh - 2,
    12
)
ScreenWorldLF:elementsDistributeV( -- md v line
    {ButtonPlayerMove000, ButtonPlayerMove180},
    WindowPlayerPortrait.screenx + 4,
    WindowPlayerPortrait.screeny - 7,
    14
)
ScreenWorldLF:elementsDistributeH( -- head and back slots
    {ButtonPlayerSlotHead, ButtonPlayerSlotBack},
    WindowPlayerPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowPlayerPortrait.screeny - 2,
    28
)
ScreenWorldLF:elementsDistributeH( -- handrg and handlf slots
    {ButtonPlayerSlotHandRG, ButtonPlayerSlotHandLF},
    WindowPlayerPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowPlayerPortrait.screeny + Tic.SPRITESIZE + 2,
    28
)

WindowPlayerStats    = CWindowPlayerStats{}
ButtonPlayerStatPhy  = CButtonPlayerStatPhy{}
ButtonPlayerStatMen  = CButtonPlayerStatMen{}
ButtonPlayerStatPsy  = CButtonPlayerStatPsy{}
ScreenWorldLF:elementsDistributeH(
    {ButtonPlayerStatPhy, ButtonPlayerStatMen, ButtonPlayerStatPsy},
    WindowPlayerStats.screenx + (
        (WindowPlayerStats.screenw - CScreen:elementsTotalW({ButtonPlayerStatPhy, ButtonPlayerStatMen, ButtonPlayerStatPsy})) // 2),
    WindowPlayerStats.screeny - Tic.SPRITESIZE + 1
)

WindowPlayerState    = CWindowPlayerState{}
ButtonPlayerStand    = CButtonPlayerStand{}
ButtonPlayerKneel    = CButtonPlayerKneel{}
ButtonPlayerWork     = CButtonPlayerWork{}
ButtonPlayerSleep    = CButtonPlayerSleep{}
ScreenWorldLF:elementsDistributeV(
    {ButtonPlayerStand, ButtonPlayerKneel},
    WindowPlayerState.screenx - Tic.SPRITESIZE,
    WindowPlayerState.screeny + (
        (WindowPlayerInfos.screenh - CScreen:elementsTotalH({ButtonPlayerStand, ButtonPlayerKneel})) // 2)
)
ScreenWorldLF:elementsDistributeV(
    {ButtonPlayerWork, ButtonPlayerSleep},
    WindowPlayerState.screenx + WindowPlayerState.screenw,
    WindowPlayerState.screeny + (
        (WindowPlayerInfos.screenh - CScreen:elementsTotalH({ButtonPlayerWork, ButtonPlayerSleep})) // 2)
)

ScreenWorldLF:appendElements{
    WindowPlayerPortrait,
    WindowPlayerInfos,
    WindowPlayerStats,
    WindowPlayerState,
    ButtonPlayerPrev,
    ButtonPlayerPick,
    ButtonPlayerNext,
    ButtonPlayerStatPhy,
    ButtonPlayerStatMen,
    ButtonPlayerStatPsy,
    ButtonPlayerSlotHead,
    ButtonPlayerSlotBack,
    ButtonPlayerSlotHandLF,
    ButtonPlayerSlotHandRG,
    ButtonPlayerMove000,
    ButtonPlayerMove045,
    ButtonPlayerMove090,
    ButtonPlayerMove135,
    ButtonPlayerMove180,
    ButtonPlayerMove225,
    ButtonPlayerMove270,
    ButtonPlayerMove315,
    ButtonPlayerStand,
    ButtonPlayerKneel,
    ButtonPlayerWork,
    ButtonPlayerSleep,
}

-- md panel
ScreenWorldMD = CScreen{name = "ScreenWorldMD"}

WindowInfosWorld    = CWindowInfosWorld{}
WindowWorld         = CWindowWorld{}
WindowMessagesWorld = CWindowMessagesWorld{}
ScreenWorldMD:appendElements{
    WindowWorld,
    WindowInfosWorld,
    WindowMessagesWorld,
}

-- rg panel
ScreenWorldRG = CScreen{name = "ScreenWorldRG"}

WindowSpottingInfos    = CWindowSpottingInfos{}
ButtonSpottingSpot     = CButtonSpottingSpot{}
ButtonSpottingLock     = CButtonSpottingLock{}
ButtonSpottingPick     = CButtonSpottingPick{}
ScreenWorldRG:elementsDistributeH(
    {ButtonSpottingSpot, ButtonSpottingPick, ButtonSpottingLock},
    WindowSpottingInfos.screenx + (
        (WindowSpottingInfos.screenw - CScreen:elementsTotalW({ButtonSpottingSpot, ButtonSpottingPick, ButtonSpottingLock})) // 2),
    WindowSpottingInfos.screeny - Tic.SPRITESIZE + 1
)

WindowSpottingPortrait   = CWindowSpottingPortrait{}
ButtonSpotting000        = CButtonSpotting000{}
ButtonSpotting045        = CButtonSpotting045{}
ButtonSpotting090        = CButtonSpotting090{}
ButtonSpotting135        = CButtonSpotting135{}
ButtonSpotting180        = CButtonSpotting180{}
ButtonSpotting225        = CButtonSpotting225{}
ButtonSpotting270        = CButtonSpotting270{}
ButtonSpotting315        = CButtonSpotting315{}
ButtonSpottingSlotHead   = CButtonSpottingSlotHead{}
ButtonSpottingSlotBack   = CButtonSpottingSlotBack{}
ButtonSpottingSlotHandLF = CButtonSpottingSlotHandLF{}
ButtonSpottingSlotHandRG = CButtonSpottingSlotHandRG{}
ScreenWorldRG:elementsDistributeH( -- up h line
    {ButtonSpotting135, ButtonSpotting225},
    WindowSpottingPortrait.screenx - 6,
    WindowSpottingPortrait.screeny - Tic.SPRITESIZE + 2,
    12
)
ScreenWorldRG:elementsDistributeH( -- md h line
    {ButtonSpotting090, ButtonSpotting270},
    WindowSpottingPortrait.screenx - 7,
    WindowSpottingPortrait.screeny + 4,
    14
)
ScreenWorldRG:elementsDistributeH( -- dw h line
    {ButtonSpotting045, ButtonSpotting315},
    WindowSpottingPortrait.screenx - 6,
    WindowSpottingPortrait.screeny + WindowSpottingPortrait.screenh - 2,
    12
)
ScreenWorldRG:elementsDistributeV( -- md v line
    {ButtonSpotting180, ButtonSpotting000},
    WindowSpottingPortrait.screenx + 4,
    WindowSpottingPortrait.screeny - 7,
    14
)
ScreenWorldRG:elementsDistributeH( -- head and back slots
    {ButtonSpottingSlotHead, ButtonSpottingSlotBack},
    WindowSpottingPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowSpottingPortrait.screeny - 2,
    28
)
ScreenWorldRG:elementsDistributeH( -- handrg and handlf slots
    {ButtonSpottingSlotHandRG, ButtonSpottingSlotHandLF},
    WindowSpottingPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowSpottingPortrait.screeny + Tic.SPRITESIZE + 2,
    28
)

WindowMenuInteractions = CWindowMenuInteractions{}
ButtonInteractions = CButtonInteractions{}
ScreenWorldRG:elementsDistributeH(
    {ButtonInteractions},
    WindowMenuInteractions.screenx + (
        (WindowMenuInteractions.screenw - CScreen:elementsTotalW({ButtonInteractions})) // 2),
    WindowMenuInteractions.screeny - Tic.SPRITESIZE + 1
)


ScreenWorldRG:appendElements{
    WindowSpottingPortrait,
    WindowSpottingInfos,
    WindowMenuInteractions,
    ButtonSpottingPick,
    ButtonSpottingLock,
    ButtonSpottingSpot,
    ButtonSpottingSlotHead,
    ButtonSpottingSlotBack,
    ButtonSpottingSlotHandLF,
    ButtonSpottingSlotHandRG,
    ButtonSpotting000,
    ButtonSpotting045,
    ButtonSpotting090,
    ButtonSpotting135,
    ButtonSpotting180,
    ButtonSpotting225,
    ButtonSpotting270,
    ButtonSpotting315,
    ButtonInteractions,
}

ScreenWorld:appendElements{
    CWindowScreen{name = "ScreenWorld"},
    ScreenWorldMD,
    ScreenWorldLF,
    ScreenWorldRG,
}
