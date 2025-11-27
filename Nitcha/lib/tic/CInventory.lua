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
    self.inventorytype = CInventoryAny -- allowed inventory type objects
	self.objectsmax    = Nums.MAXINTEGER
	self.objects       = {}
    self:argt(_argt)
end

function CInventory:isInventory(_inventory)
    return Classic:thatis(_inventory, CInventory)
end

function CInventory:isFull()
    return (Tables:size(self.objects) >= self.objectsmax)
end

function CInventory:notFull()
    return (Tables:size(self.objects) < self.objectsmax)
end

function CInventory:isEmpty()
    return (Tables:size(self.objects) == 0)
end

function CInventory:canAppend()
    return self:notFull() -- inventory not full
end

function CInventory:canAppendObject(_object)
    if not _object then return false end -- mandatory
    if not _object.inventorytype then return false end -- only storable objects
    if not self:canAppend() then return false end -- inventory already full
    if Tables:valFind(self.objects, _object) then return false end -- already in inventory
    if self.inventorytype == CInventoryAny
    or self.inventorytype == _object.inventorytype then return true end -- allowed type if any
    return false
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

function CInventory:objectsOfSlotType(_slottype)
    if not CSlot:isSlot(_slottype) then return end -- mandatory
    local _result = {}
    for _, _object in ipairs(self.objects) do
        if _object.slottype and _object.slottype == _slottype then Tables:valInsert(_result, _object, true) end
    end
    return _result
end

function CInventory:findObject(_object)
    return Tables:valFind(self.objects, _object)
end
                                                                            
function CInventory:bags()
    local _result = {}
    for _, _object in ipairs(self.objects or {}) do
        if _object:isBag() then Tables:valInsert(_result, _object, true) end
    end
    return _result
end
                                                                            
function CInventory:bagsNotFull()
    local _result = {}
    for _, _object in ipairs(self.objects or {}) do
        if _object:isBag() and _object.inventory:notFull() then Tables:valInsert(_result, _object, true) end
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
    self.stat          = Tic.TEXTANY
    self:argt(_argt)
end

CInventoryAny2 = CInventoryAny:extend() -- generic any inventory 2
Classic.KINDINVENTORYANY2 = "InventoryAny2"
Classic.NAMEINVENTORYANY2 = "InventoryAny2"
function CInventoryAny2:new(_argt)
    CInventoryAny2.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY2
    self.name = Classic.NAMEINVENTORYANY2
	self.objectsmax   = 2
    self:argt(_argt)
end

CInventoryAny4 = CInventoryAny:extend() -- generic any inventory 4
Classic.KINDINVENTORYANY4 = "InventoryAny4"
Classic.NAMEINVENTORYANY4 = "InventoryAny4"
function CInventoryAny4:new(_argt)
    CInventoryAny4.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY4
    self.name = Classic.NAMEINVENTORYANY4
	self.objectsmax   = 4
    self:argt(_argt)
end

CInventoryAny6 = CInventoryAny:extend() -- generic any inventory 6
Classic.KINDINVENTORYANY6 = "InventoryAny6"
Classic.NAMEINVENTORYANY6 = "InventoryAny6"
function CInventoryAny6:new(_argt)
    CInventoryAny6.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY6
    self.name = Classic.NAMEINVENTORYANY6
	self.objectsmax   = 6
    self:argt(_argt)
end

CInventoryAny8 = CInventoryAny:extend() -- generic any inventory 8
Classic.KINDINVENTORYANY8 = "InventoryAny8"
Classic.NAMEINVENTORYANY8 = "InventoryAny8"
function CInventoryAny8:new(_argt)
    CInventoryAny8.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY8
    self.name = Classic.NAMEINVENTORYANY8
	self.objectsmax   = 8
    self:argt(_argt)
end

CInventoryAny10 = CInventoryAny:extend() -- generic any inventory 10
Classic.KINDINVENTORYANY10 = "InventoryAny10"
Classic.NAMEINVENTORYANY10 = "InventoryAny10"
function CInventoryAny10:new(_argt)
    CInventoryAny10.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY10
    self.name = Classic.NAMEINVENTORYANY10
	self.objectsmax   = 10
    self:argt(_argt)
end


CInventoryPhy = CInventory:extend() -- generic phy inventory
Classic.KINDINVENTORYPHY = "InventoryPhy"
Classic.NAMEINVENTORYPHY = "InventoryPhy"
function CInventoryPhy:new(_argt)
    CInventoryPhy.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY
    self.name = Classic.NAMEINVENTORYPHY
    self.inventorytype = CInventoryPhy
    self.stat          = Tic.TEXTPHY
    self:argt(_argt)
end

CInventoryPhy2 = CInventoryPhy:extend() -- generic phy inventory 2
Classic.KINDINVENTORYPHY2 = "InventoryPhy2"
Classic.NAMEINVENTORYPHY2 = "InventoryPhy2"
function CInventoryPhy2:new(_argt)
    CInventoryPhy2.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY2
    self.name = Classic.NAMEINVENTORYPHY2
	self.objectsmax   = 2
    self:argt(_argt)
end

CInventoryPhy4 = CInventoryPhy:extend() -- generic phy inventory 4
Classic.KINDINVENTORYPHY4 = "InventoryPhy4"
Classic.NAMEINVENTORYPHY4 = "InventoryPhy4"
function CInventoryPhy4:new(_argt)
    CInventoryPhy4.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY4
    self.name = Classic.NAMEINVENTORYPHY4
	self.objectsmax   = 4
    self:argt(_argt)
end

CInventoryPhy6 = CInventoryPhy:extend() -- generic phy inventory 6
Classic.KINDINVENTORYPHY6 = "InventoryPhy6"
Classic.NAMEINVENTORYPHY6 = "InventoryPhy6"
function CInventoryPhy6:new(_argt)
    CInventoryPhy6.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY6
    self.name = Classic.NAMEINVENTORYPHY6
	self.objectsmax   = 6
    self:argt(_argt)
end

CInventoryPhy8 = CInventoryPhy:extend() -- generic phy inventory 8
Classic.KINDINVENTORYPHY8 = "InventoryPhy8"
Classic.NAMEINVENTORYPHY8 = "InventoryPhy8"
function CInventoryPhy8:new(_argt)
    CInventoryPhy8.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY8
    self.name = Classic.NAMEINVENTORYPHY8
	self.objectsmax   = 8
    self:argt(_argt)
end

CInventoryPhy10 = CInventoryPhy:extend() -- generic phy inventory 10
Classic.KINDINVENTORYPHY10 = "InventoryPhy10"
Classic.NAMEINVENTORYPHY10 = "InventoryPhy10"
function CInventoryPhy10:new(_argt)
    CInventoryPhy10.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY10
    self.name = Classic.NAMEINVENTORYPHY10
	self.objectsmax   = 10
    self:argt(_argt)
end


CInventoryMen = CInventory:extend() -- generic men inventory
Classic.KINDINVENTORYMEN = "InventoryMen"
Classic.NAMEINVENTORYMEN = "InventoryMen"
function CInventoryMen:new(_argt)
    CInventoryMen.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN
    self.name = Classic.NAMEINVENTORYMEN
    self.inventorytype = CInventoryMen
    self.stat          = Tic.TEXTMEN
    self:argt(_argt)
end

CInventoryMen2 = CInventoryMen:extend() -- generic men inventory 2
Classic.KINDINVENTORYMEN2 = "InventoryMen2"
Classic.NAMEINVENTORYMEN2 = "InventoryMen2"
function CInventoryMen2:new(_argt)
    CInventoryMen2.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN2
    self.name = Classic.NAMEINVENTORYMEN2
	self.objectsmax   = 2
    self:argt(_argt)
end

CInventoryMen4 = CInventoryMen:extend() -- generic men inventory 4
Classic.KINDINVENTORYMEN4 = "InventoryMen4"
Classic.NAMEINVENTORYMEN4 = "InventoryMen4"
function CInventoryMen4:new(_argt)
    CInventoryMen4.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN4
    self.name = Classic.NAMEINVENTORYMEN4
	self.objectsmax   = 4
    self:argt(_argt)
end

CInventoryMen6 = CInventoryMen:extend() -- generic men inventory 6
Classic.KINDINVENTORYMEN6 = "InventoryMen6"
Classic.NAMEINVENTORYMEN6 = "InventoryMen6"
function CInventoryMen6:new(_argt)
    CInventoryMen6.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN6
    self.name = Classic.NAMEINVENTORYMEN6
	self.objectsmax   = 6
    self:argt(_argt)
end

CInventoryMen8 = CInventoryMen:extend() -- generic men inventory 8
Classic.KINDINVENTORYMEN8 = "InventoryMen8"
Classic.NAMEINVENTORYMEN8 = "InventoryMen8"
function CInventoryMen8:new(_argt)
    CInventoryMen8.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN8
    self.name = Classic.NAMEINVENTORYMEN8
	self.objectsmax   = 8
    self:argt(_argt)
end

CInventoryMen10 = CInventoryMen:extend() -- generic men inventory 10
Classic.KINDINVENTORYMEN10 = "InventoryMen10"
Classic.NAMEINVENTORYMEN10 = "InventoryMen10"
function CInventoryMen10:new(_argt)
    CInventoryMen10.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN10
    self.name = Classic.NAMEINVENTORYMEN10
	self.objectsmax   = 10
    self:argt(_argt)
end


CInventoryPsy = CInventory:extend() -- generic psy inventory
Classic.KINDINVENTORYPSY = "InventoryPsy"
Classic.NAMEINVENTORYPSY = "InventoryPsy"
function CInventoryPsy:new(_argt)
    CInventoryPsy.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY
    self.name = Classic.NAMEINVENTORYPSY
    self.inventorytype = CInventoryPsy
    self.stat          = Tic.TEXTPSY
    self:argt(_argt)
end

CInventoryPsy2 = CInventoryPsy:extend() -- generic psy inventory 2
Classic.KINDINVENTORYPSY2 = "InventoryPsy2"
Classic.NAMEINVENTORYPSY2 = "InventoryPsy2"
function CInventoryPsy2:new(_argt)
    CInventoryPsy2.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY2
    self.name = Classic.NAMEINVENTORYPSY2
	self.objectsmax   = 2
    self:argt(_argt)
end

CInventoryPsy4 = CInventoryPsy:extend() -- generic psy inventory 4
Classic.KINDINVENTORYPSY4 = "InventoryPsy4"
Classic.NAMEINVENTORYPSY4 = "InventoryPsy4"
function CInventoryPsy4:new(_argt)
    CInventoryPsy4.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY4
    self.name = Classic.NAMEINVENTORYPSY4
	self.objectsmax   = 4
    self:argt(_argt)
end

CInventoryPsy6 = CInventoryPsy:extend() -- generic psy inventory 6
Classic.KINDINVENTORYPSY6 = "InventoryPsy6"
Classic.NAMEINVENTORYPSY6 = "InventoryPsy6"
function CInventoryPsy6:new(_argt)
    CInventoryPsy6.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY6
    self.name = Classic.NAMEINVENTORYPSY6
	self.objectsmax   = 6
    self:argt(_argt)
end

CInventoryPsy8 = CInventoryPsy:extend() -- generic psy inventory 8
Classic.KINDINVENTORYPSY8 = "InventoryPsy8"
Classic.NAMEINVENTORYPSY8 = "InventoryPsy8"
function CInventoryPsy8:new(_argt)
    CInventoryPsy8.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY8
    self.name = Classic.NAMEINVENTORYPSY8
	self.objectsmax   = 8
    self:argt(_argt)
end

CInventoryPsy10 = CInventoryPsy:extend() -- generic psy inventory 10
Classic.KINDINVENTORYPSY10 = "InventoryPsy10"
Classic.NAMEINVENTORYPSY10 = "InventoryPsy10"
function CInventoryPsy10:new(_argt)
    CInventoryPsy10.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY10
    self.name = Classic.NAMEINVENTORYPSY10
	self.objectsmax   = 10
    self:argt(_argt)
end
