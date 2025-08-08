require("libraries/ext/Classic")
--
-- CSlot
--
CSlot = Classic:extend() -- generic slot
Classic.KINDSLOT = "Slot" -- Slot kind
Classic.NAMESLOT = "Slot" -- Slot name
function CSlot:new(_argt)
    CSlot.super.new(self, _argt)
    self.kind = Classic.KINDSLOT
    self.name = Classic.NAMESLOT
    self.slottype = nil -- allowed slot type -- nil = any
    self.object   = nil -- object contained in the slot
    self:argt(_argt) -- override if any
end

function CSlot:isSlot(_slot)
    return _slot and type(_slot) == "table" and _slot.is and _slot:is(CSlot)
end

function CSlot:canAppendObject(_object, _emptyonly)
    _emptyonly = _emptyonly or false
    if not _object then return false end -- mandatory
    if _emptyonly and self.object then return false end -- only if slot is empty
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
Classic.KINDSLOTHEAD = "SlotHead" -- SlotHead kind
Classic.NAMESLOTHEAD = "SlotHead" -- SlotHead name
function CSlotHead:new(_argt)
    CSlotHead.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHEAD
    self.name = Classic.NAMESLOTHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CSlotBack = CSlot:extend() -- generic back slot
Classic.KINDSLOTBACK = "SlotBack" -- SlotBack kind
Classic.NAMESLOTBACK = "SlotBack" -- SlotBack name
function CSlotBack:new(_argt)
    CSlotBack.super.new(self, _argt)
    self.kind = Classic.KINDSLOTBACK
    self.name = Classic.NAMESLOTBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CSlotHand = CSlot:extend() -- generic hand slot
Classic.KINDSLOTHAND = "SlotHand" -- SlotHand kind
Classic.NAMESLOTHAND = "SlotHand" -- SlotHand name
function CSlotHand:new(_argt)
    CSlotHand.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHAND
    self.name = Classic.NAMESLOTHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CSlotHandLF = CSlotHand:extend() -- generic hand lf slot
Classic.KINDSLOTHANDLF = "SlotHandLF" -- SlotHandLF kind
Classic.NAMESLOTHANDLF = "SlotHandLF" -- SlotHandLF name
function CSlotHandLF:new(_argt)
    CSlotHandLF.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHANDLF
    self.name = Classic.NAMESLOTHANDLF
    self:argt(_argt) -- override if any
end

CSlotHandRG = CSlotHand:extend() -- generic hand rg slot
Classic.KINDSLOTHANDRG = "SlotHandRG" -- SlotHandRG kind
Classic.NAMESLOTHANDRG = "SlotHandRG" -- SlotHandRG name
function CSlotHandRG:new(_argt)
    CSlotHandRG.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHANDRG
    self.name = Classic.NAMESLOTHANDRG
    self:argt(_argt) -- override if any
end
