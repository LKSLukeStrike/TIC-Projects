_function = function(_argt) -- FIXME axecute functions with self
    _argt = _argt or {}
    local _text = _argt.text or "Plop"
    Tic:logAppend(_text)
end

ScreenIntro = CScreen{name = "Intro", keysfunctions = Tic.KEYSFUNCTIONSINTRO}

Button1 = CButtonMenuM2{
    name = "B1",
    screenx = 10,
    screeny = 10,
    screenw = 16,
    screenh = 8,
    name = "plop 1",
    hovertextup    = CHoverTextClickLF{text = "Plop"},
    hovertextupmdk = CHoverTextClickLF{text = "Plup"},
    hovertextdw    = CHoverTextClickRG{text = "Plip"},
    hovertextdwmdk = CHoverTextClickRG{text = "Plap"},
    text = CText{text = "Op"},
    clicklf    = _function,
    clicklfmdk = function() _function{text = "Plup"} end,
    clickrg    = function() _function{text = "Plip"} end,
    clickrgmdk = function() _function{text = "Plap"} end,
    wheelup = function() Tic:biomePrev() ; _function{text = "wheelup"} end,
    wheeldw = function() Tic:biomeNext() ; _function{text = "wheeldw"} end,
}

if true then
Button2 = CButtonTextM2{
    name = "B2",
    screenw = 8,
    screenh = 8,
    name = "plop 2",
    hovertextlf = CText{text = "Plop"},
    colorinside = Classic.NIL,
    text = CText{text = "C", colorinside = Tic.COLORBLUEL},
    clicklf = _function,
    -- drawborder = false,
    -- drawground = false,
    -- align = Tic.DIR270,
}
Button3 = CButtonTextM2{
    name = "B3",
    screenw = 24,
    text = CText{text = "Menu"},
}
Button4 = CButtonMenuM2{
    name = "Open",
    rounded = true,
    text = CText{text = "Open"},
    clicklf = _function,
}
Button5 = CButtonMenuM2{
    name = "Close",
    rounded = true,
    text = CText{text = "Bla"},
    clicklf = _function,
}
Button6 = CButtonMenuM2{
    name = "Quit",
    rounded = true,
    text = CText{text = "Quit"},
    clicklf = _function,
}
Button7 = CButton{
    -- name = "B7",
    screenx = 10,
    screeny = 70,
    screenw = 16,
    rounded = false,
    enabled = false,
}
Button11 = CButtonArrow315{}
Button12 = CButtonArrow225{}
Button13 = CButtonArrow135{}
Button14 = CButtonArrow045{}
Button15 = CButtonCenter{}

Button16 = CButtonCenter{
    screenx = 30,
    screeny = 60,
}
Button17 = CButtonCenter{
    screenx = 30,
    screeny = 70,
    enabled = false,
}

Button15.clicklf = Tic.FUNCTIONSCREENNEXT
-- Button7.clicklf = Tic.FUNCTIONSCREENNEXT

ScreenIntro:elementsDistributeH({Button11, Button12, Button15, Button13, Button14}, 30, 10)
ScreenIntro:elementsDistributeV({Button1, Button2, Button3}, 10, 10, 2)
ScreenIntro:elementsDistributeV({Button4, Button5, Button6}, 100, 10, 2)
end

ScreenIntro:appendElements{
    CWindowScreen{name = "Intro",
        colorground = Tic:biomeActual(),
        behaviour = function(self)
            self.colorground = Tic:biomeActual()
        end
    },
    CWindowInfos{
        name = "PressKey",
        drawground = false,
        drawframes = false,
        elements = {
            CTextLine{text = "Press", colorinside = Tic.COLORORANGE},
            CTextLine{text = "a", colorinside = Tic.COLORGREYM},
            CTextLine{text = "Key", colorinside = Tic.COLORORANGE},
        },
    },
    Button1,
    Button2,
    Button3,
    Button4,
    Button5,
    Button6,
    Button7,

    Button11,
    Button12,
    Button13,
    Button14,
    Button15,

    Button16,
    Button17,
    ButtonPlayerPrev,
    ButtonPlayerNext,
}

