require("lib/tic/CEntity")
--
-- CEntityDrawable
--
CEntityDrawable = CEntity:extend() -- generic entities with a sprite representation
Classic.KINDENTITYDRAWABLE = "EntityDrawable"
Classic.NAMEENTITYDRAWABLE = "EntityDrawable"
CEntityDrawable.PALETTEINTERACTTO = {}
CEntityDrawable.PALETTEINTERACTBY = {[Tic.COLORWHITE] = Tic.COLORGREYL}
function CEntityDrawable:new(_argt)
    CEntityDrawable.super.new(self, _argt)
    self.classic = CEntityDrawable
    self.kind    = Classic.KINDENTITYDRAWABLE
    self.name    = Classic.NAMEENTITYDRAWABLE
    --
    self.world          = Tic:worldActual()
    self.sprite         = CSpriteBG.SIGNEMPTYS
    self.screenx        = 0 -- screen positions -- used to draw the sprite
    self.screeny        = 0
    self.offsetx        = 0
    self.offsety        = 0
    self.dirx           = Nums:random01() -- random flip lf/rg
    self.scale          = Tic.SCALE01
    self.rotate         = Tic.ROTATE000
    self.idle           = false -- dont move ?
    self.portraitmode   = false -- true to avoid to cycle in portraits etc
    self.animations     = nil -- override if any
    self.hovered        = false -- use hovered to draw a border
    self.spotted        = false -- use spotted to draw a border
    self.hitbox         = CHitbox{entity = self, lf = 0, rg = 7, up = 0, dw = 7}
    self.drawborders    = false -- draw behaviour
    self.drawhitbox     = false
    self.drawfade       = false
    self.drawbgfg       = Tic.DRAWFG -- use bg/fg palette if any
    self.hoverbutton    = CButtonEntityHoverLock{entity = self} -- hover button
    self.musprite       = CSprite{} -- multi usage sprite
    self.interactsprite = CSpriteFG.EFFECTOBIMK
    --
    self:argt(_argt) -- override if any
end

function CEntityDrawable:argt(_argt) -- append an entity
    CEntity.super.argt(self, _argt)
    self:append()
end

function CEntityDrawable:append() -- append an entity
    self:worldAppend()
end

function CEntityDrawable:worldAppend() -- append an entity to world
    if not self.world then return end
    self.world:appendEntity(self)
end

function CEntityDrawable:delete() -- delete an entity
    self:worldDelete()
    self:interactDelete()
end

function CEntityDrawable:worldDelete() -- delete an entity from world
    if not self.world then return end
    self.world:deleteEntity(self)
end

function CEntityDrawable:interactDelete() -- delete all interactions
    self:interactbyRemoveAll()
end

function CEntityDrawable:draw() -- default draw for drawable entities -- override if any
    local _tick00      = Tic.TICK00.actvalue

    local _palette     = Tables:merge(self.palette, self.palettefg) -- apply diverse palettes if any
    _palette = (self.drawbgfg == Tic.DRAWBG)
        and Tables:merge(_palette, self.palettebg)
        or  _palette
    _palette = (self.drawfade)
        and Tables:merge(_palette, self.palettefade)
        or  _palette

    for _, _animation in pairs(self.animations or {}) do -- animate
        local _frequence   = _animation.frequence
        local _percent0    = _animation.percent0
        local _palette0    = _animation.palette0
        local _palette1    = _animation.palette1
        local _frequence01 = Nums:frequence01(_tick00, _frequence)
        local _random01    = Nums:random01(_percent0)
        local _palette01   = _frequence01 * _random01 -- palette0 if frequence0 or random0
        _palette = (_palette01 == 0)
            and Tables:merge(_palette, _palette0)
            or  Tables:merge(_palette, _palette1)
    end

    self.musprite:init()
    self.musprite.sprite  = self.sprite
    self.musprite.name    = self.name
    self.musprite.screenx = self.screenx
    self.musprite.screeny = self.screeny
    self.musprite.offsetx = self.offsetx
    self.musprite.offsety = self.offsety
    self.musprite.flip    = self.dirx
    self.musprite.scale   = self.scale
    self.musprite.rotate  = self.rotate
    self.musprite.palette = _palette
    self.musprite:draw()

    self:drawSpotted()
    self:drawHovered()
    self:drawBorders()
    self:drawHitbox()

    self:drawInteractBy()
end

function CEntityDrawable:drawSpotted() -- draw spotted if any
    if not self.spotted then return end -- dont draw

    self.musprite:init()
    self.musprite.sprite  = CSpriteBG.SIGNSPOTSQ
    self.musprite.screenx = self.screenx
    self.musprite.offsetx = self.offsetx
    self.musprite.offsety = self.offsety
    self.musprite.screeny = self.screeny
    self.musprite.scale   = self.scale
    self.musprite.palette = {[Tic.COLORGREYM] = Tic.COLORWHITE,}
    self.musprite:draw()
end

function CEntityDrawable:drawHovered() -- draw hovered if any
    if not self.hovered then return end -- dont draw
    self.hoverbutton:draw()
end

function CEntityDrawable:drawBorders() -- draw borders if any
    self.drawborders = Tic.DRAWBORDERS -- use Tic as master
    if not self.drawborders then return end -- dont draw

    self.musprite:init()
    self.musprite.sprite  = CSpriteBG.SIGNBORDSQ
    self.musprite.screenx = self.screenx
    self.musprite.screeny = self.screeny
    self.musprite.offsetx = self.offsetx
    self.musprite.offsety = self.offsety
    self.musprite.scale   = self.scale
    self.musprite.palette = {[Tic.COLORGREYM] = Tic.COLORGREYL,}
    self.musprite:draw()
end

function CEntityDrawable:drawHitbox() -- draw hitbox if any
    self.drawhitbox = Tic.DRAWHITBOX -- use Tic as master
    if not self.drawhitbox or not self.hitbox then return end -- dont draw
    self.hitbox:draw()
end

function CEntityDrawable:drawInteractBy()
    if not self:hasInteractBy() then return end -- dont draw

    local _offsetx  = (self.dirx == Tic.DIRXLF)
        and -2
        or   2
    
    self.musprite:init()
    self.musprite.sprite  = self.interactsprite -- apply the corresponding attributes
    self.musprite.screenx = self.screenx
    self.musprite.screeny = self.screeny
    self.musprite.offsetx = _offsetx * self.scale
    self.musprite.offsety = Nums:neg(Tic.SPRITESIZE * self.scale)
    self.musprite.scale   = self.scale
    self.musprite.flip    = self.dirx
    self.musprite.palette = CEntityDrawable.PALETTEINTERACTBY
    self.musprite:draw()
end

function CEntityDrawable:adjustScreenXYRelativeToEntity(_entity) -- adjust an entity screen xy relative to an other one in world positions
    if not _entity then return end -- mandatory
	local _offsetx = self.worldx - _entity.worldx
	local _offsety = self.worldy - _entity.worldy
	self.screenx = Tic.WORLDWX2 + _offsetx - (Tic.SPRITESIZE2 * self.scale)
	self.screeny = Tic.WORLDWY2 + _offsety - (Tic.SPRITESIZE2 * self.scale)
end

function CEntityDrawable:regionWorld() -- return its own region in world
    return CRegion{
        lf = self.worldx,
        rg = self.worldx + (Tic.SPRITESIZE * self.scale) - 1,
        up = self.worldy,
        dw = self.worldy + (Tic.SPRITESIZE * self.scale) - 1,
    }
end

function CEntityDrawable:regionScreen() -- return its own region in screen
    return CRegion{
        lf = self.screenx,
        rg = self.screenx + (Tic.SPRITESIZE * self.scale) - 1,
        up = self.screeny,
        dw = self.screeny + (Tic.SPRITESIZE * self.scale) - 1,
    }
end

function CEntityDrawable:hitboxAttachTo(_entities) -- attach hitto entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox and _entity.hitbox then
            self.hitbox:hittoAppend(_entity)
            _entity.hitbox:hitbyAppend(self)
        end
    end
end

function CEntityDrawable:hitboxDetachTo(_entities) -- detach hitto entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox and _entity.hitbox then
            self.hitbox:hittoDelete(_entity)
            _entity.hitbox:hitbyDelete(self)
        end
    end
end

function CEntityDrawable:hitboxDetachBy(_entities) -- detach hitby entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox and _entity.hitbox then
            self.hitbox:hitbyDelete(_entity)
            _entity.hitbox:hittoDelete(self)
        end
    end
end

function CEntityDrawable:hitboxDetachSelf() -- detach itself from hitto entities
    self:hitboxDetachTo({[self] = self})
end

function CEntityDrawable:hitboxDetachAllTo() -- detach all hitto entities
	if not self.hitbox then return end -- dont detach
	self:hitboxDetachTo(self.hitbox.hitto)
end

function CEntityDrawable:hitboxDetachAllBy() -- detach all hitby entities
	if not self.hitbox then return end -- nothing to detach
	self:hitboxDetachBy(self.hitbox.hitby)
end

function CEntityDrawable:hitboxDetachAll() -- detach all hitto/hitby entities
	self:hitboxDetachAllTo()
	self:hitboxDetachAllBy()
end

function CEntityDrawable:hitboxRegionWorld() -- hitbox in world -- depends on dirx
	if not self.hitbox then return end -- mandatory
	return self.hitbox:regionAdjusted():offsetXY(self.worldx, self.worldy)
end

function CEntityDrawable:drawPortrait(_argt) -- draw entity to board then back to screen -- limit the drawing to sprite size
    self:save()
    self:argt(_argt)
    self.interactto   = nil   -- dont draw interactto in portrait window
    self.interactby   = {}    -- dont draw interactby in portrait window
    self.spotted      = false -- dont draw spotted frame in portrait window
    self.hovered      = false -- dont draw hovered frame in portrait window
    self.portraitmode = true  -- dont cycle in portrait window
    if self.idle then
        self.dirx       = Tic.DIRXLF
        self.frame      = CSprite.FRAME00
        self.animations = {}
    end
    self:draw()
    self:load()
end

function CEntityDrawable:isHovered() -- check if the mouse hovers the entity
    return self:regionScreen():hasInsidePoint(Tic:mousePointX(), Tic:mousePointY())
end

