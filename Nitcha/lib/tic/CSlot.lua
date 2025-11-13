--
-- CSlot
--
CSlot = Classic:extend() -- generic slot
Classic.KINDSLOT = "Slot"
Classic.NAMESLOT = "Slot"
function CSlot:new(_argt)
    CSlot.super.new(self, _argt)
    self.kind = Classic.KINDSLOT
    self.name = Classic.NAMESLOT
    self.slottype = nil -- allowed slot type -- nil = any
    self.object   = nil -- object contained in the slot
    self:argt(_argt)
end

function CSlot:isSlot(_slot)
    return Classic:thatis(_slot, CSlot)
end

function CSlot:canAppendObject(_object, _emptyonly)
    _emptyonly = _emptyonly or false
    if _emptyonly and self.object then return false end -- only if slot is empty
    if not _object then return true end -- allows nil object
    if not _object.slottype then return false end -- mandatory -- only slotable objects
    if self.slottype and not (_object.slottype == self.slottype) then return false end -- not allowed type if any
    return true
end

function CSlot:appendObject(_object, _emptyonly)
    if not self:canAppendObject(_object, _emptyonly) then return end -- nil = false
    self.object = _object
    return _object -- done
end

function CSlot:removeObject(_object, _sameonly)
    _sameonly = _sameonly or false
    if not _object then return end -- mandatory
    if _sameonly and not (self.object == _object) then return end -- only if object is already in slot
    self.object = nil
    return _object -- done
end

function CSlot:objectsinInventories(_inventories)
    local _result = {}
    for _, _inventory in pairs(_inventories or {}) do
        if CInventory:isInventory(_inventory) then
            Tables:imerge(_result, _inventory:objectsofSlotType(self.slottype))
        end
    end
    return _result
end

CSlotHead = CSlot:extend() -- generic head slot
Classic.KINDSLOTHEAD = "SlotHead"
Classic.NAMESLOTHEAD = "SlotHead"
function CSlotHead:new(_argt)
    CSlotHead.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHEAD
    self.name = Classic.NAMESLOTHEAD
    self.slottype = CSlotHead
    self:argt(_argt)
end

CSlotBack = CSlot:extend() -- generic back slot
Classic.KINDSLOTBACK = "SlotBack"
Classic.NAMESLOTBACK = "SlotBack"
function CSlotBack:new(_argt)
    CSlotBack.super.new(self, _argt)
    self.kind = Classic.KINDSLOTBACK
    self.name = Classic.NAMESLOTBACK
    self.slottype = CSlotBack
    self:argt(_argt)
end

CSlotHand = CSlot:extend() -- generic hand slot
Classic.KINDSLOTHAND = "SlotHand"
Classic.NAMESLOTHAND = "SlotHand"
function CSlotHand:new(_argt)
    CSlotHand.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHAND
    self.name = Classic.NAMESLOTHAND
    self.slottype = CSlotHand
    self:argt(_argt)
end

CSlotHandLF = CSlotHand:extend() -- generic hand lf slot
Classic.KINDSLOTHANDLF = "SlotHandLF"
Classic.NAMESLOTHANDLF = "SlotHandLF"
function CSlotHandLF:new(_argt)
    CSlotHandLF.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHANDLF
    self.name = Classic.NAMESLOTHANDLF
    self:argt(_argt)
end

CSlotHandRG = CSlotHand:extend() -- generic hand rg slot
Classic.KINDSLOTHANDRG = "SlotHandRG"
Classic.NAMESLOTHANDRG = "SlotHandRG"
function CSlotHandRG:new(_argt)
    CSlotHandRG.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHANDRG
    self.name = Classic.NAMESLOTHANDRG
    self:argt(_argt)
end
