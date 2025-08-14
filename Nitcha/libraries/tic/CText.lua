require("libraries/tic/CElement")
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
    self.screenw = print(self.text, Nums.MININTEGER, Nums.MININTEGER, self.colorinside, self.fixed, self.scale, self.small)
    self.screenw = self.screenw + (self.marginlf * self.scale) + (self.marginrg * self.scale)
    self.screenh = Tic.FONTH * self.scale
    self.screenh = self.screenh + (self.marginup * self.scale) + (self.margindw * self.scale)
end

function CText:drawInside()
    self.text = Names:case(self.text, self.case)
    if self.shadow then
        print(
            self.text,
            self.screenx + (self.marginlf * self.scale) + self.scale,
            self.screeny + (self.marginup * self.scale) + self.scale,
            self.colorshadow,
            self.fixed,
            self.scale,
            self.small
        )
    end
    print(
        self.text,
        self.screenx + (self.marginlf * self.scale),
        self.screeny + (self.marginup * self.scale),
        self.colorinside,
        self.fixed,
        self.scale,
        self.small
    )
end
