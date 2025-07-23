--
-- CLocations
--
CLocations = Classic:extend() -- generic entities locations -- {worldy {worldx {entity = entity}}} -- FIXME change entity by true ?
Classic.KINDLOCATIONS = "Locations" -- Locations kind
Classic.NAMELOCATIONS = "Locations" -- Locations name
function CLocations:new(_argt)
    CLocations.super.new(self, _argt)
    self.kind = Classic.KINDLOCATIONS
    self.name = Classic.NAMELOCATIONS
    self.locations = {}
    self:argt(_argt) -- override if any
end

function CLocations:entities(_locations) -- entities in locations
    local _result = {}

    for _keyy, _valy in pairs(_locations or {}) do -- loop on y
		for _keyx, _valx in pairs(_valy) do -- loop on x
			for _entity, _ in pairs(_valx) do -- loop on entities
				_result[_entity] = _entity
			end
		end
    end

    return _result -- entities
end

function CLocations:appendEntity(_entity, _range) -- append a new entity -- [!] allows doublons
    if not _entity then return end -- mandatory
    self:spreadEntity(_entity, _range)
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy
    if not self.locations[_worldy] then -- new worldy entry
        self.locations[_worldy] = {}
    end
    if not self.locations[_worldy][_worldx] then -- new worldx entry in existing worldy
        self.locations[_worldy][_worldx] = {}
    end
    self.locations[_worldy][_worldx][_entity] = _entity
end

function CLocations:spreadEntity(_entity, _range) -- try to find an empty location within range if any
    if not _entity then return end -- mandatory
    _range = Nums:pos(_range) or 0
    if _range == 0 then return end -- no spread
    local _spreadlocations = {}
    for _spready = _entity.worldy - _range, _entity.worldy + _range do
        for _spreadx = _entity.worldx - _range, _entity.worldx + _range do
            if not self.locations[_spready] or not self.locations[_spready][_spreadx] then
                if not _spreadlocations[_spready] then _spreadlocations[_spready] = {} end
                _spreadlocations[_spready][_spreadx] = true
            end
        end
    end
    if Tables:size(_spreadlocations) == 0 then return end -- stay on initial positions
    _entity.worldy = Tables:keyPickRandom(_spreadlocations)
    _entity.worldx = Tables:keyPickRandom(_spreadlocations[_entity.worldy])
end

function CLocations:deleteEntity(_entity) -- delete an existing entity
    if not _entity then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy
    if not self.locations[_worldy][_worldx][_entity] then return end -- doesnt exist
    self.locations[_worldy][_worldx][_entity] = nil
    if Tables:size(self.locations[_worldy][_worldx]) == 0 then self.locations[_worldy][_worldx] = nil end -- cleanup
    if Tables:size(self.locations[_worldy]) == 0 then self.locations[_worldy] = nil end
end

function CLocations:moveEntityWorldXY(_entity, _worldx, _worldy, _range) -- move an existing entity
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    if not self.locations[_entity.worldy][_entity.worldx][_entity] then return end -- doesnt exist
    self:deleteEntity(_entity)
    _entity.worldx = _worldx
    _entity.worldy = _worldy
    self:appendEntity(_entity, _range)
end

function CLocations:locationsRegion(_region) -- locations in region
    if not _region then return end -- mandatory
    local _result  = {}

    for _keyy, _valy in pairs(self.locations) do -- search for y in range
        if Nums:isBW(_keyy, _region.up, _region.dw)
        or Nums:isBW(_keyy + Tic.SPRITESIZE - 1, _region.up, _region.dw) then
            for _keyx, _valx in pairs(_valy) do -- search for x in range
                if Nums:isBW(_keyx, _region.lf, _region.rg)
                or Nums:isBW(_keyx + Tic.SPRITESIZE - 1, _region.lf, _region.rg) then
                    for _entity, _ in pairs(_valx) do -- loop on entities
                        if not _result[_keyy] then -- new worldy entry
                            _result[_keyy] = {}
                        end
                        if not _result[_keyy][_keyx] then -- new worldx entry in existing worldy
                            _result[_keyy][_keyx] = {}
                        end
                        _result[_keyy][_keyx][_entity] = _entity -- build up locations
                    end
                end
            end
        end
    end
	
    return _result -- locations
end

function CLocations:locationsWorldXYRegion(_worldx, _worldy, _region) -- locations in region around world xy
    if not _worldx or not _worldy or not _region then return end -- mandatory
    return self:locationsRegion(_region:offsetXY(_worldx, _worldy))
end

function CLocations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey) -- locations in ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self:locationsWorldXYRegion(_worldx, _worldy, CRegion{
        lf = Nums:neg(_rangex),
        rg = Nums:pos(_rangex),
        up = Nums:neg(_rangey),
        dw = Nums:pos(_rangey),
    })
end

function CLocations:locationsEntityRegion(_entity, _region) -- locations in region
    if not _entity or not _region then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy

    return self:locationsWorldXYRegion(_worldx, _worldy, _region)
end

function CLocations:locationsEntityRangeXY(_entity, _rangex, _rangey) -- locations in ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy

    return self:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey)
end
