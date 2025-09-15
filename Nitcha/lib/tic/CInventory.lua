--
-- CInventory
--
CInventory = Classic:extend() -- generic inventory
Classic.KINDINVENTORY = "Inventory"
Classic.NAMEINVENTORY = "Inventory"
function CInventory:new(_argt)
    CInventory.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORY
    self.name = Classic.NAMEINVENTORY
    self.objectstypes = nil -- list of allowed inventory classes -- nil = any
	self.objectsmax   = Nums.MAXINTEGER
	self.objects      = {}
    self:argt(_argt) -- override if any
end

function CInventory:isInventory(_inventory)
    return Classic:thatis(_inventory, CInventory)
end

function CInventory:canAppendObject(_object)
    if not _object then return false end -- mandatory
    if not _object.inventorytype then return false end -- mandatory -- only storable objects
    if self.objectstypes and not Tables:valFind(self.objectstypes, _object.inventorytype) then return false end -- not allowed type if any
    if not Tables:valFind(self.objects, _object) -- not in inventory
    and Tables:size(self.objects) >= self.objectsmax then return false end -- and cannot append, inventory full
    return true
end

function CInventory:appendObject(_object)
    if not self:canAppendObject(_object) then return end -- nil = false
    Tables:valInsert(self.objects, _object, true) -- add the object
    return _object -- done
end

function CInventory:removeObject(_object)
    if not _object then return end -- mandatory
    if not Tables:valFind(self.objects, _object) then return end -- not in inventory
    Tables:valRemove(self.objects, _object) -- remove all -- should not happend
    return _object -- ok
end

function CInventory:copytoInventory(_inventory)
    if not _inventory then return end -- mandatory
    if _inventory == self then return end -- avoid itself
    local _garbage = {}
    local _objects = Tables:iclone(self.objects, true)
    for _, _object in ipairs(_objects) do
        if not _inventory:appendObject(_object) then
            Tables:valInsert(_garbage, _object, true)
        end
    end
    return _garbage
end

function CInventory:movetoInventory(_inventory)
    if not _inventory then return end -- mandatory
    if _inventory == self then return end -- avoid itself
    local _garbage = {}
    local _objects = Tables:iclone(self.objects, true)
    for _, _object in ipairs(_objects) do
        if not _inventory:appendObject(_object) then
            Tables:valInsert(_garbage, _object, true)
        else
            self:removeObject(_object)
        end
    end
    return _garbage
end

function CInventory:objectsofSlotType(_slottype)
    if not CSlot:isSlot(_slottype) then return end -- mandatory
    local _result = {}
    for _, _object in ipairs(self.objects or {}) do
        if _object.slottype and _object.slottype == _slottype then Tables:valInsert(_result, _object, true) end
    end
    return _result
end

CInventoryAny = CInventory:extend() -- generic any inventory
Classic.KINDINVENTORYANY = "InventoryAny"
Classic.NAMEINVENTORYANY = "InventoryAny"
function CInventoryAny:new(_argt)
    CInventoryAny.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY
    self.name = Classic.NAMEINVENTORYANY
    self:argt(_argt) -- override if any
end

CInventoryPhy = CInventory:extend() -- generic phy inventory
Classic.KINDINVENTORYPHY = "InventoryPhy"
Classic.NAMEINVENTORYPHY = "InventoryPhy"
function CInventoryPhy:new(_argt)
    CInventoryPhy.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY
    self.name = Classic.NAMEINVENTORYPHY
    self.objectstypes = {CInventoryPhy}
    self:argt(_argt) -- override if any
end

CInventoryMen = CInventory:extend() -- generic men inventory
Classic.KINDINVENTORYMEN = "InventoryMen"
Classic.NAMEINVENTORYMEN = "InventoryMen"
function CInventoryMen:new(_argt)
    CInventoryMen.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN
    self.name = Classic.NAMEINVENTORYMEN
    self.objectstypes = {CInventoryMen}
    self:argt(_argt) -- override if any
end

CInventoryPsy = CInventory:extend() -- generic psy inventory
Classic.KINDINVENTORYPSY = "InventoryPsy"
Classic.NAMEINVENTORYPSY = "InventoryPsy"
function CInventoryPsy:new(_argt)
    CInventoryPsy.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY
    self.name = Classic.NAMEINVENTORYPSY
    self.objectstypes = {CInventoryPsy}
    self:argt(_argt) -- override if any
end

CInventoryAny2 = CInventoryAny:extend() -- generic any inventory 2
Classic.KINDINVENTORYANY2 = "InventoryAny2"
Classic.NAMEINVENTORYANY2 = "InventoryAny2"
function CInventoryAny2:new(_argt)
    CInventoryAny2.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY2
    self.name = Classic.NAMEINVENTORYANY2
	self.objectsmax   = 2
    self:argt(_argt) -- override if any
end

CInventoryAny4 = CInventoryAny:extend() -- generic any inventory 4
Classic.KINDINVENTORYANY4 = "InventoryAny4"
Classic.NAMEINVENTORYANY4 = "InventoryAny4"
function CInventoryAny4:new(_argt)
    CInventoryAny4.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY4
    self.name = Classic.NAMEINVENTORYANY4
	self.objectsmax   = 4
    self:argt(_argt) -- override if any
end

CInventoryAny6 = CInventoryAny:extend() -- generic any inventory 6
Classic.KINDINVENTORYANY6 = "InventoryAny6"
Classic.NAMEINVENTORYANY6 = "InventoryAny6"
function CInventoryAny6:new(_argt)
    CInventoryAny6.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY6
    self.name = Classic.NAMEINVENTORYANY6
	self.objectsmax   = 6
    self:argt(_argt) -- override if any
end

CInventoryAny8 = CInventoryAny:extend() -- generic any inventory 8
Classic.KINDINVENTORYANY8 = "InventoryAny8"
Classic.NAMEINVENTORYANY8 = "InventoryAny8"
function CInventoryAny8:new(_argt)
    CInventoryAny8.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY8
    self.name = Classic.NAMEINVENTORYANY8
	self.objectsmax   = 8
    self:argt(_argt) -- override if any
end

CInventoryAny10 = CInventoryAny:extend() -- generic any inventory 10
Classic.KINDINVENTORYANY10 = "InventoryAny10"
Classic.NAMEINVENTORYANY10 = "InventoryAny10"
function CInventoryAny10:new(_argt)
    CInventoryAny10.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY10
    self.name = Classic.NAMEINVENTORYANY10
	self.objectsmax   = 10
    self:argt(_argt) -- override if any
end
