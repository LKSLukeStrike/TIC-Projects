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
    self.stretch     = true
    self.screenh     = Tic.FONTH
    self.drawground  = false -- draw beheviors
    self.drawguides  = false
    self.drawinside  = true
    self.drawcaches  = false
    self.drawborder  = false
    self.drawframes  = false
    self.text        = ""
    self.fixed       = true
    self.small       = true
    self.shadow      = false -- add a shadow ?
    self.case        = nil
    self.colorinside = Tic.COLORGREYL
    self.colorshadow = Tic.COLORGREYD
    self:argt(_argt) -- override if any
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
    self:argt(_argt) -- override if any
end

