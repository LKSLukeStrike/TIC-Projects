--
-- IElement
--
IElement = Classic:extend() -- generic screen element implementation
IElement.BEHAVIOUR = nil


--
-- CElement
--
CElement = Classic:extend() -- generic screen element -- TODO build this class
Classic.KINDELEMENT = "Element" -- Element kind
Classic.NAMEELEMENT = "Element" -- Element name
function CElement:new(_argt)
    CElement.super.new(self, _argt)
    self.kind = Classic.KINDELEMENT
    self.name = Classic.NAMEELEMENT
    self.screenx     = Tic.SCREENX -- positions
    self.screeny     = Tic.SCREENY
    self.screenw     = Tic.SCREENW -- sizes
    self.screenh     = Tic.SCREENH
    self.scale       = Tic.SCALE01
    self.align       = Tic.DIRHIT -- sub elements alignment
    self.marginlf    = 0
    self.marginrg    = 0
    self.marginup    = 0
    self.margindw    = 0
    self.separatorx  = 0     -- separator between elements in px if any
    self.separatory  = 0     -- separator between elements in px if any
    self.stretch     = false -- stretch elements ?
	self.rounded     = false -- rounded border and frames ?
    self.parent      = nil   -- parent element
    self.elements    = {}    -- sub elements if any
    self.behaviour   = IElement.BEHAVIOUR   -- behaviour function if any
    self.display     = true  -- display or not ?
    self.drawground  = true  -- draw beheviors
    self.drawguides  = true
    self.drawinside  = true
    self.drawcaches  = true
    self.drawborder  = true
    self.drawframes  = true
    self.cachestick  = Tic.SPRITESIZE     -- caches thickness
    self.colorground = Tic.COLORHUDSCREEN -- colors
    self.colorguides = Tic.COLORGREYM
    self.colorinside = Tic.COLORGREYM
    self.colorcaches = Tic.COLORHUDSCREEN
    self.colorborder = Tic.COLORGREYM
    self.colorframe1 = Tic.COLORWHITE
    self.colorframe2 = Tic.COLORGREYL
    self.keysfunctions = nil -- keys to functions mapping if any
    self.clickable     = false -- act as a button ?
    self:argt(_argt) -- override if any
end

function CElement:draw() -- element drawing
    if not self:behave() then return end -- nothing to draw
    if self.drawground then self:drawGround() end
    if self.drawguides then self:drawGuides() end
    if self.drawinside then self:drawInside() end
    if self.drawcaches then self:drawCaches() end
    if self.drawborder then self:drawBorder() end
    if self.drawframes then self:drawFrames() end
    Tic:keyboardAppendKeysFunctions(self.keysfunctions)
    if self.clickable then Tic:buttonsInsertButton(self) end
    for _, _element in ipairs(self.elements or {}) do -- sub elements if any
        _element:draw()
    end
end

function CElement:sizeWH() -- total WH sizes including margins
    return {sizew = self.marginlf + self.screenw + self.marginrg, sizeh = self.marginup + self.screenh + self.margindw}
end

function CElement:behave() -- execute the behaviour if any
    if type(self.behaviour) == "function" then self:behaviour() end
    return self.display -- display ?
end

function CElement:drawGround() -- element ground
    if self.rounded then
        rect(self.screenx + 2, self.screeny + 1, self.screenw - 4, self.screenh - 2, self.colorground)
        rect(self.screenx + 1, self.screeny + 2, self.screenw - 2, self.screenh - 4, self.colorground)
    else
        rect(self.screenx, self.screeny, self.screenw, self.screenh, self.colorground)
    end
end

function CElement:drawGuides() -- element guides -- FIXME still not working -- use ratio w h ?
    rect( -- hline md
		self.screenx,
		self.screeny + ((Nums:isEven(self.screenh)) and (self.screenh // 2) - 1 or (self.screenh // 2)),
        self.screenw,
		(Nums:isEven(self.screenh)) and 2 or 1,
        self.colorguides
    )
    rect( -- vline md
		self.screenx + ((Nums:isEven(self.screenw)) and (self.screenw // 2) - 1 or (self.screenw // 2)),
		self.screeny,
        (Nums:isEven(self.screenw)) and 2 or 1,
		self.screenh,
        self.colorguides
    )
    line( -- diag up lf - dw rg
		self.screenx,
		self.screeny,
        self.screenx + self.screenw - 1,
		self.screeny + self.screenh - 1,
        self.colorguides
    )
    line( -- diag dw lf - up rg
		self.screenx,
		self.screeny + self.screenh - 1,
        self.screenx + self.screenw - 1,
		self.screeny,
        self.colorguides
    )
end

function CElement:drawInside() -- element inside
    -- override
end

function CElement:drawCaches() -- element caches
    rect( -- lf cache
		self.screenx - self.cachestick,
		self.screeny,
        self.cachestick,
		self.screenh,
        self.colorcaches
    )
    rect( -- rg cache
		self.screenx + self.screenw,
		self.screeny,
        self.cachestick,
		self.screenh,
        self.colorcaches
    )
    rect( -- up cache
		self.screenx - self.cachestick,
		self.screeny - self.cachestick,
        self.screenw + (self.cachestick * 2),
		self.cachestick,
        self.colorcaches
    )
    rect( -- dw cache
		self.screenx - self.cachestick,
		self.screeny + self.screenh,
        self.screenw + (self.cachestick * 2),
		self.cachestick,
        self.colorcaches
    )
end

function CElement:drawBorder() -- element single border
    if self.rounded then
        rect(self.screenx + 1, self.screeny, self.screenw - 2, 1, self.colorborder)
        rect(self.screenx + 1, self.screeny + 1, 1, 1, self.colorborder)
        rect(self.screenx +  self.screenw - 2, self.screeny + 1, 1, 1, self.colorborder)
        rect(self.screenx, self.screeny + 1, 1, self.screenh - 2, self.colorborder)
        rect(self.screenx + 1, self.screeny + self.screenh - 1, self.screenw - 2, 1, self.colorborder)
        rect(self.screenx + 1, self.screeny + self.screenh - 2, 1, 1, self.colorborder)
        rect(self.screenx +  self.screenw - 2, self.screeny + self.screenh - 2, 1, 1, self.colorborder)
        rect(self.screenx + self.screenw - 1, self.screeny + 1, 1, self.screenh - 2, self.colorborder)
    else
        rectb(
            self.screenx,
            self.screeny,
            self.screenw,
            self.screenh,
            self.colorborder
        )
    end
end

function CElement:drawFrames() -- element double frames
    rectb( -- bg frame
        self.screenx - 2,
        self.screeny - 2,
        self.screenw + 5,
        self.screenh + 5,
        self.colorframe2
    )
    rectb( -- fg frame
        self.screenx - 3,
        self.screeny - 3,
        self.screenw + 5,
        self.screenh + 5,
        self.colorframe1
    )
end

function CElement:region() -- element region
    return CRegion{
        lf = self.screenx,
        rg = self.screenx + self.screenw - 1,
        up = self.screeny,
        dw = self.screeny + self.screenh - 1,
    }
end

function CElement:alignElementDirection(_element, _direction) -- align a sub element from itself -- use direction
    if not _element then return end -- mandatory
    _direction = _direction or Tic.DIRHIT -- center by default

    if Tables:valFind({Tic.DIR315, Tic.DIR270, Tic.DIR225}, _direction) then -- LF
        _element.screenx = self.screenx
    elseif Tables:valFind({Tic.DIR000, Tic.DIRHIT, Tic.DIR180}, _direction) then -- MD
        _element.screenx = self.screenx + ((self.screenw - _element.screenw) // 2)
    else -- RG
        _element.screenx = self.screenx + (self.screenw - _element.screenw)
    end
    
    if Tables:valFind({Tic.DIR315, Tic.DIR000, Tic.DIR045}, _direction) then -- UP
        _element.screeny = self.screeny
    elseif Tables:valFind({Tic.DIR270, Tic.DIRHIT, Tic.DIR090}, _direction) then -- MD
        _element.screeny = self.screeny + ((self.screenh - _element.screenh) // 2)
    else -- DW
        _element.screeny = self.screeny + (self.screenh - _element.screenh)
    end
end

function CElement:appendElement(_element) -- append element -- unique
    if not _element then return end -- mandarory
    if not _element:is(CElement) then return end -- only elements
    _element.parent = self -- record parent
    Tables:valInsert(self.elements, _element, true)
end

function CElement:appendElements(_elements) -- append elements -- unique
    for _, _element in ipairs(_elements or {}) do
        self:appendElement(_element)
    end
end

function CElement:removeElement(_element) -- remove element -- all
    if not _element then return end -- mandarory
    if not _element:is(CElement) then return end -- only elements
    _element.parent = nil -- remove parent
    Tables:valRemove(self.elements, _element, false)
end

function CElement:removeElements(_elements) -- remove elements -- all
    for _, _element in ipairs(_elements or {}) do
        self:removeElement(_element)
    end
end

function CElement:elementsTotalW(_elements, _separator) -- total w of elements with optional separator
    _separator = _separator or 0
    local _result = 0
    for _, _element in ipairs(_elements or {}) do
        _result = _result + _element.screenw + _separator
    end
    _result = (_result == 0) and _result or _result - _separator -- skip last separator
    return _result
end

function CElement:elementsTotalH(_elements, _separator) -- total h of elements with optional separator
    _separator = _separator or 0
    local _result = 0
    for _, _element in ipairs(_elements or {}) do
        _result = _result + _element.screenh + _separator
    end
    _result = (_result == 0) and _result or _result - _separator -- skip last separator
    return _result
end

function CElement:elementsDistributeH(_elements, _screenx, _screeny, _separator) -- distribute h elements with optional separator and xy
    _separator = _separator or 0
    for _, _element in ipairs(_elements or {}) do
        if _screenx then
            if _screenx >= 0 then -- gt 0 force x
                _element.screenx = _screenx
            else -- lt 0 keep its own x -- not useful here
            end
        else -- nil ajust x to the first element
            _screenx = _element.screenx
        end
        if _screeny then
            if _screeny >= 0 then -- gt 0 force y
                _element.screeny = _screeny
            else -- lt 0 keep its own y
            end
        else -- nil ajust y to the first element
            _screeny = _element.screeny
        end
        _screenx = _screenx + _element.screenw + _separator
    end
end

function CElement:elementsDistributeV(_elements, _screenx, _screeny, _separator) -- distribute v elements with optional separator and xy
    _separator = _separator or 0
    for _, _element in ipairs(_elements or {}) do
        if _screenx then
            if _screenx >= 0 then -- gt 0 force x
                _element.screenx = _screenx
            else -- lt 0 keep its own x
            end
        else -- nil ajust x to the first element
            _screenx = _element.screenx
        end
        if _screeny then
            if _screeny >= 0 then -- gt 0 force y
                _element.screeny = _screeny
            else -- lt 0 keep its own y -- not useful here
            end
        else -- nil ajust y to the first element
            _screeny = _element.screeny
        end
        _screeny = _screeny + _element.screenh + _separator
    end
end
