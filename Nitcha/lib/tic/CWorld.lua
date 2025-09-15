require("lib/tic/CEntity")
--
-- CWorld
--
CWorld = CEntity:extend() -- generic world that contains entities
Classic.KINDWORLD = "World"
Classic.NAMEWORLD = "World"
function CWorld:new(_argt)
    CWorld.super.new(self, _argt)
    self.classic = CWorld -- instance of
    self.kind = Classic.KINDWORLD
    self.name = Classic.NAMEWORLD
    self.region            = CRegion{} -- world boundaries
    self.entitieslocations = CEntitiesLocations{} -- record world entities and their locations
    self:argt(_argt) -- override if any
end

function CWorld:appendEntity(_entity, _range, _trials) -- append an entity in the world
    if not _entity then return end -- mandatory
    _entity.world = self -- parent world
    self.entitieslocations:appendEntity(_entity, _range, _trials)
end

function CWorld:deleteEntity(_entity) -- delete an entity from the world
    if not _entity then return end -- mandatory
    self.entitieslocations:deleteEntity(_entity)
end

function CWorld:moveEntityWorldXY(_entity, _worldx, _worldy, _range, _trials) -- move an entity into the world
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    self.entitieslocations:moveEntityWorldXY(_entity, _worldx, _worldy, _range, _trials)
    _entity:focus() -- focus its camera on itself
end

function CWorld:locationsRegion(_region) -- locations in region
    if not _region then return end -- mandatory
    return self.entitieslocations:locationsRegion(_region)
end

function CWorld:locationsWorldXYRegion(_worldx, _worldy, _region) -- locations in region
    if not _worldx or not _worldy or not _region then return end -- mandatory
    return self.entitieslocations:locationsWorldXYRegion(_worldx, _worldy, _region)
end

function CWorld:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey) -- locations in ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self.entitieslocations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey)
end

function CWorld:locationsEntityRegion(_entity, _region) -- locations in region
    if not _entity or not _region then return end -- mandatory
    return self.entitieslocations:locationsEntityRegion(_entity, _region)
end

function CWorld:locationsEntityRangeXY(_entity, _rangex, _rangey) -- locations in ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    return self.entitieslocations:locationsEntityRangeXY(_entity, _rangex, _rangey)
end
