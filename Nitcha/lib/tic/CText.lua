require("lib/tic/CElement")
--
-- CText
--
CText = CElement:extend() -- generic text element
Classic.KINDTEXT = "Text"
Classic.NAMETEXT = "Text"
function CText:new(_argt)
    CText.super.new(self, _argt)
    self.kind = Classic.KINDTEXT
    self.name = Classic.NAMETEXT
    --
    self.stretch     = true
    self.screenh     = Tic.FONTH
    self.drawground  = false -- draw beheviors
    self.drawguides  = false
    self.drawinside  = true
    self.drawborder  = false
    self.drawframes  = false
    self.text        = ""
    self.fixed       = true
    self.small       = true
    self.shadow      = false -- add a shadow ?
    self.case        = nil
    self.colorinside = Tic.COLORGREYL
    self.colorshadow = Tic.COLORGREYD
    --
    self:argt(_argt)
    self:adjustWH()
end

function CText:setText(_text)
    _text = _text or ""
    self.text = _text
    self:adjustWH()
end

function CText:adjustWH() -- adjust screenw, screenh
    if self.stretch then
        self.screenw = print(self.text, Nums.MININTEGER, Nums.MININTEGER, self.colorinside, self.fixed, self.scale, self.small)
        self.screenh = Tic.FONTH * self.scale
    end
    self.screenw = (self.marginlf * self.scale) + self.screenw + (self.marginrg * self.scale)
    self.screenh = (self.marginup * self.scale) + self.screenh + (self.margindw * self.scale)
end

function CText:drawInside()
    self.text = Names:case(self.text, self.case)

    local _selfelement = CElement{
        screenx = self.screenx + (self.marginlf * self.scale),
        screeny = self.screeny + (self.marginup * self.scale),
        screenw = self.screenw - (self.marginlf * self.scale) - (self.marginrg * self.scale),
        screenh = self.screenh - (self.marginup * self.scale) - (self.margindw * self.scale),
    }
    local _textelement = CElement{
        screenx = 0,
        screeny = 0,
        screenw = print(self.text, Nums.MININTEGER, Nums.MININTEGER, self.colorinside, self.fixed, self.scale, self.small),
        screenh = Tic.FONTH * self.scale,
    }
    _selfelement:alignElementDirection(_textelement, self.align)

    if self.shadow then
        print(
            self.text,
            _textelement.screenx + self.scale,
            _textelement.screeny + self.scale,
            self.colorshadow,
            self.fixed,
            self.scale,
            self.small
        )
    end
    print(
        self.text,
        _textelement.screenx,
        _textelement.screeny,
        self.colorinside,
        self.fixed,
        self.scale,
        self.small
    )
end


--
-- CTextLine
--
CTextLine = CText:extend() -- generic text line element
Classic.KINDTEXTLINE = "TextLine"
Classic.NAMETEXTLINE = "TextLine"
function CTextLine:new(_argt)
    CTextLine.super.new(self, _argt)
    self.kind = Classic.KINDTEXTLINE
    self.name = Classic.NAMETEXTLINE
    --
    --
    self:argt(_argt)
end


--
-- CHoverText
--
CHoverText = CText:extend() -- generic hovertext
Classic.KINDHOVERTEXT = "HoverText"
Classic.NAMEHOVERTEXT = "HoverText"
function CHoverText:new(_argt)
    CHoverText.super.new(self, _argt)
    self.kind = Classic.KINDHOVERTEXT
    self.name = Classic.NAMEHOVERTEXT
    --
    self.marginlf    = 1
    self.drawground  = true
    self.colorground = Tic.COLORHOVERGROUND
    self.mousesprite = nil
    --
    self:argt(_argt)
end

CHoverTextMouse = CHoverText:extend() -- generic hovertextmouse
function CHoverTextMouse:new(_argt)
    CHoverTextMouse.super.new(self, _argt)
    --
    self.colorinside = Tic.COLORHOVERMOUSE
    --
    self:argt(_argt)
end

CHoverTextInfos = CHoverText:extend() -- generic hovertextinfos
function CHoverTextInfos:new(_argt)
    CHoverTextInfos.super.new(self, _argt)
    --
    self.colorinside = Tic.COLORHOVERINFOS
    --
    self:argt(_argt)
end

CHoverTextClickLF = CHoverTextMouse:extend() -- generic hovertextclicklf
function CHoverTextClickLF:new(_argt)
    CHoverTextClickLF.super.new(self, _argt)
    --
    self.mousesprite = CSprite:spriteMouseClickLF()
    --
    self:argt(_argt)
end

CHoverTextClickRG = CHoverTextMouse:extend() -- generic hovertextclickrg
function CHoverTextClickRG:new(_argt)
    CHoverTextClickRG.super.new(self, _argt)
    --
    self.mousesprite = CSprite:spriteMouseClickRG()
    --
    self:argt(_argt)
end

CHoverTextWheelUP = CHoverTextMouse:extend() -- generic hovertextclicklf
function CHoverTextWheelUP:new(_argt)
    CHoverTextWheelUP.super.new(self, _argt)
    --
    self.mousesprite = CSprite:spriteMouseWheelUP()
    --
    self:argt(_argt)
end

CHoverTextWheelDW = CHoverTextMouse:extend() -- generic hovertextclickrg
function CHoverTextWheelDW:new(_argt)
    CHoverTextWheelDW.super.new(self, _argt)
    --
    self.mousesprite = CSprite:spriteMouseWheelDW()
    --
    self:argt(_argt)
end

CHoverTextInfosUP = CHoverTextInfos:extend() -- generic hovertextup

CHoverTextInfosDW = CHoverTextInfos:extend() -- generic hovertextdw

CHoverTextInfosLF = CHoverTextInfos:extend() -- generic hovertextlf

CHoverTextInfosRG = CHoverTextInfos:extend() -- generic hovertextrg

CHoverTextInfosUL = CHoverTextInfos:extend() -- generic hovertextul

CHoverTextInfosUR = CHoverTextInfos:extend() -- generic hovertextur

CHoverTextInfosDL = CHoverTextInfos:extend() -- generic hovertextdl

CHoverTextInfosDR = CHoverTextInfos:extend() -- generic hovertextdr
