local Classic = require("lib/ext/Classic")
--
-- CRegion
--
CRegion = Classic:extend() -- generic region -- lf rg up dw around a point
Classic.KINDREGION = "Region"
Classic.NAMEREGION = "Region"
function CRegion:new(_argt)
    CRegion.super.new(self, _argt)
    self.kind = Classic.KINDREGION
    self.name = Classic.NAMEREGION
    self.lf = Nums.MININTEGER
    self.rg = Nums.MAXINTEGER
    self.up = Nums.MININTEGER
    self.dw = Nums.MAXINTEGER
    self:argt(_argt) -- override if any
end

function CRegion:string() -- region as a string
    return Nums:roundint(self.lf)..":"..Nums:roundint(self.rg), Nums:roundint(self.up)..":"..Nums:roundint(self.dw)
end

function CRegion:borderW(_scale) -- border width
    _scale = _scale or Tic.SCALE01
    return self.rg - self.lf + (1 * _scale)
end

function CRegion:borderH(_scale) -- border height
    _scale = _scale or Tic.SCALE01
    return self.dw - self.up + (1 * _scale)
end

function CRegion:surface() -- region surface
    return self:borderW() * self:borderH()
end

function CRegion:offsetXY(_offsetx, _offsety) -- offset a region by x y
    _offsetx = _offsetx or 0
    _offsety = _offsety or 0
    return CRegion{
        lf = self.lf + _offsetx,
        rg = self.rg + _offsetx,
        up = self.up + _offsety,
        dw = self.dw + _offsety,
    }
end

function CRegion:randomWH(_width, _height) -- returns a region of random width and height
    _width  = _width  or Nums.MAXINTEGER -- be careful with that ;)
    _height = _height or Nums.MAXINTEGER
    _width  = (_width == 0)  and 1  or _width -- avoid weird results with math.random(0)
    _height = (_height == 0) and 1  or _height
    return CRegion{
        lf = Nums:neg(math.random(_width)),
        rg = Nums:pos(math.random(_width)),
        up = Nums:neg(math.random(_height)),
        dw = Nums:pos(math.random(_height)),
    }
end

function CRegion:hasInsidePoint(_pointx, _pointy) -- is a point inside a region ?
    _pointx = _pointx or 0
    _pointy = _pointy or 0
	if not Nums:isBW(_pointx, self.lf, self.rg) then return false end
	if not Nums:isBW(_pointy, self.up, self.dw) then return false end
	return true
end

function CRegion:hasInsideRegion(_region) -- is a region inside a region ?
	if not _region then return false end -- mandatory
	if self:hasInsidePoint(_region.lf, _region.up) then return true end
	if self:hasInsidePoint(_region.rg, _region.up) then return true end
	if self:hasInsidePoint(_region.lf, _region.dw) then return true end
	if self:hasInsidePoint(_region.rg, _region.dw) then return true end
	return false
end

function CRegion:directionRegion(_region) -- returns the direction from a region to a region
    if not _region then return end -- mandatory
    if self.up > _region.dw then -- lower than entity
        if self.lf > _region.rg then return Tic.DIR315 end
        if self.rg < _region.lf then return Tic.DIR045 end
        return Tic.DIR000
    elseif self.dw < _region.up then -- upper than entity
        if self.lf > _region.rg then return Tic.DIR225 end
        if self.rg < _region.lf then return Tic.DIR135 end
        return Tic.DIR180
    else -- same level than entity
        if self.rg < _region.lf then return Tic.DIR090 end
        if self.lf > _region.rg then return Tic.DIR270 end
        return Tic.DIRHIT
    end
end
