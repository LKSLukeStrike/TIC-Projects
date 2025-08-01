require("libraries/ext/Classic")
--
-- CEntity
--
CEntity = Classic:extend() -- generic entities like worlds, places, objects, characters, cameras ...
Classic.KINDENTITY = "Entity" -- Entity kind
Classic.NAMEENTITY = "Entity" -- Entity name
Classic.NAMEEMPTY  = "Empty"  -- Empty name
Classic.NAMEDYING  = "Dying"   -- Dying name
Classic.NAMESILENT = "Silent" -- Silent name
Classic.NAMELIVING = "Living" -- Living name
Classic.NAMEANIMED = "Animed" -- Animed name
Classic.NAMEFITFUL = "Fitful" -- Fitful name
CEntity.WORLDX = 0
CEntity.WORLDY = 0
function CEntity:new(_argt)
    CEntity.super.new(self, _argt)
    self.classic = CEntity -- instance of
    self.classed = nil -- override to limit argt
    self.kind = Classic.KINDENTITY
    self.name = Classic.NAMEENTITY
    self.world        = nil -- parent world if any
    self.worldx       = CEntity.WORLDX -- world positions
    self.worldy       = CEntity.WORLDY
    self.discovered   = false -- discovered by the player ?
    self.interactions = nil -- possible interactions if any
    self.interactto   = nil -- entity interactto -- single
    self.interactby   = {}  -- entities interactby -- table
    self.camera = nil -- optional camera that follows the entity -- to override if any
    self:argt(_argt) -- override if any
end

function CEntity:string() -- entity as a string
    return self.worldx, self.worldy, self.kind, self.name
end

function CEntity:focus() -- focus camera on itself
    if not self.camera then return end -- requires a camera
    self.camera:focusEntity(self)
end

function CEntity:locationsRegion(_region) -- locations in a region from itself
    if not _region then return end -- mandatory
    if not self.camera then return end -- requires a camera
    self:focus()
    return self.camera:locationsRegion(_region)
end

function CEntity:locationsAround() -- locations around itself
    if not self.camera then return end -- requires a camera
    self:focus()
    return self.camera:locationsAround()
end

function CEntity:nearestEntityAround() -- nearest entity around itself, except itself
    local _result          = nil
    local _locationsaround = self:locationsAround()
    local _entitiesaround  = CLocations:entities(_locationsaround)

    for _entity, _ in pairs(_entitiesaround) do
        if not (_entity == self) then -- avoid to nearest itself
            if _result == nil then
                _result = _entity -- first nearest entity
            elseif self:distanceEntityFake(_entity) < self:distanceEntityFake(_result) then
                _result = _entity -- new nearest entity
            end
        end
    end

    return _result
end

function CEntity:randomRegionWorld(_region) -- random worldx worldy in a region -- default min/max
    _region = _region or CRegion{}
    self.world:deleteEntity(self) -- delete itself from its old position -- FIXME why remove/append here ?
    self.worldx = Nums:random(_region.lf, _region.rg)
    self.worldy = Nums:random(_region.up, _region.dw)
    self.world:appendEntity(self) -- append itself from its new position
end

function CEntity:randomWorldWindow() -- random worldx worldy into the world window region
    self:randomRegionWorld(CRegion{
        lf = Nums:neg(Tic.WORLDWW2),
        rg = Nums:pos(Tic.WORLDWW2),
        up = Nums:neg(Tic.WORLDWH2),
        dw = Nums:pos(Tic.WORLDWH2),
    })
end

function CEntity:distanceEntityReal(_entity) -- real distance from itself to another entity -- slower
    if not _entity then return 0 end -- mandatory
    return Nums:distancePointsReal(self.worldx, self.worldy, _entity.worldx, _entity.worldy)
end

function CEntity:distanceEntityFake(_entity) -- fake distance from itself to another entity -- faster
    if not _entity then return 0 end -- mandatory
    return Nums:distancePointsFake(self.worldx, self.worldy, _entity.worldx, _entity.worldy)
end

function CEntity:interacttoAppend(_entity) -- append an entity interactto
    if not _entity then return end -- mandatory
    if not _entity:hasInteractions() then return end -- no interaction possible
    self.interactto = _entity
end

function CEntity:interacttoDelete() -- delete an entity interactto
    self.interactto = nil
end

function CEntity:interactbyAppend(_entity) -- append an entity interactby
    if not _entity then return end -- mandatory
    if not self:hasInteractions() then return end -- no interaction possible
    Tables:keyAppend(self.interactby, _entity)
end

function CEntity:interactbyDelete(_entity) -- delete an entity interactby
    if not _entity then return end -- mandatory
    Tables:keyDelete(self.interactby, _entity)
end

function CEntity:interactbyDeleteAll() -- delete all entities interactby
    self.interactby = {}
end

function CEntity:hasInteractTo() -- has interactto ?
    return (self.interactto) 
end

function CEntity:hasInteractBy() -- has interactby ?
    return Tables:size(self.interactby) > 0
end

function CEntity:hasInteractions() -- has interactions ?
    return Tables:size(self.interactions) > 0
end
