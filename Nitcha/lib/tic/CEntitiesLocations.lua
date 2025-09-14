--
-- CEntitiesLocations
--
CEntitiesLocations = Classic:extend() -- generic locations for entities
Classic.KINDENTITIESLOCATIONS = "EntitiesLocations"
Classic.NAMEENTITIESLOCATIONS = "EntitiesLocations"
function CEntitiesLocations:new(_argt)
    CEntitiesLocations.super.new(self, _argt)
    self.kind = Classic.KINDENTITIESLOCATIONS
    self.name = Classic.NAMEENTITIESLOCATIONS
    self.entities  = {} -- record each entity -- has to have worldx and worldy attributes
    self.locations = CLocations{} -- record each entity locations
    self:argt(_argt) -- override if any
end

function CEntitiesLocations:existsEntity(_entity) -- if exists an entity
    if not _entity then return false end -- mandatory
    return self.entities[_entity]
end

function CEntitiesLocations:appendEntity(_entity, _range, _trials) -- add a new entity
    if not _entity then return end -- mandatory
    if self:existsEntity(_entity) then return end -- avoid doublons
    self.entities[_entity] = _entity
    self.locations:appendEntity(_entity, _range, _trials)
end

function CEntitiesLocations:deleteEntity(_entity) -- delete an entity
    if not _entity then return end -- mandatory
    if not self:existsEntity(_entity) then return end -- doesnt exist
    self.entities[_entity] = nil
    self.locations:deleteEntity(_entity)
end

function CEntitiesLocations:moveEntityWorldXY(_entity, _worldx, _worldy, _range, _trials) -- move an existing entity
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    if not self.entities[_entity] then return end -- doesnt exist
    self.locations:moveEntityWorldXY(_entity, _worldx, _worldy, _range, _trials)
end

function CEntitiesLocations:locationsRegion(_region) -- locations in region
    if not _region then return end -- mandatory
    return self.locations:locationsRegion(_region)
end

function CEntitiesLocations:locationsWorldXYRegion(_worldx, _worldy, _region) -- locations in world xy region
    if not _worldx or not _worldy or not _region then return end -- mandatory
    return self.locations:locationsWorldXYRegion(_worldx, _worldy, _region)
end

function CEntitiesLocations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey) -- locations in world xy ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self.locations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey)
end

function CEntitiesLocations:locationsEntityRegion(_entity, _region) -- locations in entity region
    if not _entity or not _region then return end -- mandatory
    return self.locations:locationsEntityRegion(_entity, _region)
end

function CEntitiesLocations:locationsEntityRangeXY(_entity, _rangex, _rangey) -- locations in entity ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    return self.locations:locationsEntityRangeXY(_entity, _rangex, _rangey)
end
