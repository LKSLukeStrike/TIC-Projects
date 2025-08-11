require("libraries/tic/CEntityDrawable")
--
-- CObject
--
CObject = CEntityDrawable:extend() -- generic objects
Classic.KINDOBJECT = "Object"
Classic.NAMEOBJECT = "Object"
CObject.HANDLE         = Tic.COLORWHITE
CObject.BORDER         = Tic.COLORGREYD
CObject.INSIDE         = Tic.COLORGREYM
CObject.EFFECT         = Tic.COLORGREYL
CObject.EXTRA1         = Tic.COLORPURPLE
CObject.EXTRA2         = Tic.COLORRED
CObject.USED1          = Tic.COLORBLUEM
CObject.USED2          = Tic.COLORBLUEL
CObject.COLORPHYL      = Tic.COLORORANGE -- phy
CObject.COLORPHYM      = Tic.COLORRED
CObject.COLORPHYD      = Tic.COLORPURPLE
CObject.COLORMENL      = Tic.COLORGREENL -- men
CObject.COLORMENM      = Tic.COLORGREENM
CObject.COLORMEND      = Tic.COLORGREEND
CObject.COLORPSYL      = Tic.COLORBLUEL  -- psy
CObject.COLORPSYM      = Tic.COLORBLUEM
CObject.COLORPSYD      = Tic.COLORBLUED
CObject.COLORMAGIC1BG  = Tic.COLORBLUED -- magic1
CObject.COLORMAGIC1FG  = Tic.COLORBLUEM
CObject.COLORMAGIC2BG  = Tic.COLORBLUEL -- magic2
CObject.COLORMAGIC2FG  = Tic.COLORCYAN
CObject.COLORWOODBG    = Tic.COLORRED -- wood
CObject.COLORWOODFG    = Tic.COLORORANGE
CObject.COLORFIREBG    = Tic.COLORRED -- fire
CObject.COLORFIREFG    = Tic.COLORORANGE
CObject.COLORLEATHERXG = Tic.COLORPURPLE -- leather
CObject.COLORLEATHERBG = Tic.COLORRED -- leather
CObject.COLORLEATHERFG = Tic.COLORORANGE
CObject.COLORIRONBG    = Tic.COLORGREYM -- iron
CObject.COLORIRONFG    = Tic.COLORGREYL
CObject.COLORONYXBG    = Tic.COLORGREYD -- onyx
CObject.COLORONYXFG    = Tic.COLORGREYM
CObject.COLORAZURBG    = Tic.COLORBLUED -- azur
CObject.COLORAZURFG    = Tic.COLORBLUEM
CObject.COLORFLASKG    = Tic.COLORGREEND -- flask glass
CObject.USEDNONE       = "None" -- used levels
CObject.USEDHALF       = "Half"
CObject.USEDFULL       = "Full"
function CObject:new(_argt)
    CObject.super.new(self, _argt)
    self.kind = Classic.KINDOBJECT
    self.name = Classic.NAMEOBJECT
    self.used         = CObject.USEDNONE -- used level if any
    self.inventories  = nil -- can have an inventories if any
    self:argt(_argt) -- override if any
end


--
-- CObjectInventory
--
CObjectInventory = CObject:extend() -- generic inventory objects
Classic.KINDOBJECTPHY = "ObjectPhy"
Classic.NAMEOBJECTPHY = "ObjectPhy"
function CObjectInventory:new(_argt)
    CObjectInventory.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHY
    self.name = Classic.NAMEOBJECTPHY
    self.hitbox        = nil -- no hitbox by default to pick
    self.inventorytype = CInventoryAny
    self.interactions  = {
                         CInteractionPickObject{},
                        }
    self:argt(_argt) -- override if any
end

function CObjectInventory:handleOffsets(_state)
    local _result   = Tables:merge(self.handleoffsets[self.stateshandles[_state].rotate])
    _result.rotate  = self.stateshandles[_state].rotate
    _result.flip    = self.stateshandles[_state].flip
    _result.handlex = ((_result.flip == Tic.FLIPHORI) or (_result.flip == Tic.FLIPBOTH)) -- flip the handlex if any
        and Tic.SPRITESIZE - 1 - _result.handlex
        or  _result.handlex
    _result.handley = ((_result.flip == Tic.FLIPVERT) or (_result.flip == Tic.FLIPBOTH)) -- flip the handlex if any
        and Tic.SPRITESIZE - 1 - _result.handley
        or  _result.handley
    return _result
end

function CObjectInventory:findFreeInventory(_inventories) -- can store oject in inventory ?
    for _, _inventory in pairs(_inventories or {}) do
        if CInventory:isInventory(_inventory) then
            if _inventory:canAppendObject(self) then return _inventory end
        end
    end
    return -- not found
end

function CObjectInventory:findWhatInventory(_inventories) -- in what inventory is object stored ?
    for _, _inventory in pairs(_inventories or {}) do
        if CInventory:isInventory(_inventory) then
            if Tables:valFind(_inventory.objects, self) then return _inventory end
        end
    end
    return -- not found
end

function CObjectInventory:findFreeSlot(_slots) -- can store object in a free slot ?
    for _, _slot in pairs(_slots or {}) do
        if CSlot:isSlot(_slot) then
            if _slot:canAppendObject(self, true) then return _slot end
        end
    end
    return -- not found
end

function CObjectInventory:findWhatSlot(_slots) -- in what slot is object stored ?
    for _, _slot in pairs(_slots or {}) do
        if CSlot:isSlot(_slot) then
            if _slot.object == self then return _slot end
        end
    end
    return -- not found
end


--
-- CObjectPhy
--
CObjectPhy = CObjectInventory:extend() -- generic phy objects
Classic.KINDOBJECTPHY = "ObjectPhy"
Classic.NAMEOBJECTPHY = "ObjectPhy"
function CObjectPhy:new(_argt)
    CObjectPhy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHY
    self.name = Classic.NAMEOBJECTPHY
    self.inventorytype = CInventoryPhy
    self:argt(_argt) -- override if any
end

CObjectPhyHand = CObjectPhy:extend() -- generic phy hand objects
Classic.KINDOBJECPHYHAND = "ObjectPhyHand"
Classic.NAMEOBJECPHYHAND = "ObjectPhyHand"
function CObjectPhyHand:new(_argt)
    CObjectPhyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECPHYHAND
    self.name = Classic.NAMEOBJECPHYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectPhyHead = CObjectPhy:extend() -- generic phy head objects
Classic.KINDOBJECTPHYHEAD = "ObjectPhyHead"
Classic.NAMEOBJECTPHYHEAD = "ObjectPhyHead"
function CObjectPhyHead:new(_argt)
    CObjectPhyHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHYHEAD
    self.name = Classic.NAMEOBJECTPHYHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectPhyBack = CObjectPhy:extend() -- generic phy back objects
Classic.KINDOBJECTPHYBACK = "ObjectPhyBack"
Classic.NAMEOBJECTPHYBACK = "ObjectPhyBack"
function CObjectPhyBack:new(_argt)
    CObjectPhyBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHYBACK
    self.name = Classic.NAMEOBJECTPHYBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectPhyNone = CObjectPhy:extend() -- generic phy none objects
Classic.KINDOBJECTPHYNONE = "ObjectPhyNone"
Classic.NAMEOBJECTPHYNONE = "ObjectPhyNone"
function CObjectPhyNone:new(_argt)
    CObjectPhyNone.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHYNONE
    self.name = Classic.NAMEOBJECTPHYNONE
    self.slottype = nil
    self:argt(_argt) -- override if any
end


--
-- CObjectMen
--
CObjectMen = CObjectInventory:extend() -- generic men objects
Classic.KINDOBJECTMEN = "ObjectMen"
Classic.NAMEOBJECTMEN = "ObjectMen"
function CObjectMen:new(_argt)
    CObjectMen.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTMEN
    self.name = Classic.NAMEOBJECTMEN
    self.inventorytype = CInventoryMen
    self:argt(_argt) -- override if any
end

CObjectMenHand = CObjectMen:extend() -- generic men hand objects
Classic.KINDOBJECMENHAND = "ObjectMenHand"
Classic.NAMEOBJECMENHAND = "ObjectMenHand"
function CObjectMenHand:new(_argt)
    CObjectMenHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECMENHAND
    self.name = Classic.NAMEOBJECMENHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectMenHand = CObjectMen:extend() -- generic men hand objects
Classic.KINDOBJECMENHAND = "ObjectMenHand"
Classic.NAMEOBJECMENHAND = "ObjectMenHand"
function CObjectMenHand:new(_argt)
    CObjectMenHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECMENHAND
    self.name = Classic.NAMEOBJECMENHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectMenHead = CObjectMen:extend() -- generic men head objects
Classic.KINDOBJECTMENHEAD = "ObjectMenHead"
Classic.NAMEOBJECTMENHEAD = "ObjectMenHead"
function CObjectMenHead:new(_argt)
    CObjectMenHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTMENHEAD
    self.name = Classic.NAMEOBJECTMENHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectMenBack = CObjectMen:extend() -- generic men back objects
Classic.KINDOBJECTMENBACK = "ObjectMenBack"
Classic.NAMEOBJECTMENBACK = "ObjectMenBack"
function CObjectMenBack:new(_argt)
    CObjectMenBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTMENBACK
    self.name = Classic.NAMEOBJECTMENBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectMenNone = CObjectMen:extend() -- generic men none objects
Classic.KINDOBJECTMENNONE = "ObjectMenNone"
Classic.NAMEOBJECTMENNONE = "ObjectMenNone"
function CObjectMenNone:new(_argt)
    CObjectMenNone.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTMENNONE
    self.name = Classic.NAMEOBJECTMENNONE
    self.slottype = nil
    self:argt(_argt) -- override if any
end


--
-- CObjectPsy
--
CObjectPsy = CObjectInventory:extend() -- generic psy objects
Classic.KINDOBJECTPSY = "ObjectPsy"
Classic.NAMEOBJECTPSY = "ObjectPsy"
function CObjectPsy:new(_argt)
    CObjectPsy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPSY
    self.name = Classic.NAMEOBJECTPSY
    self.inventorytype = CInventoryPsy
    self:argt(_argt) -- override if any
end

CObjectPsyHand = CObjectPsy:extend() -- generic psy hand objects
Classic.KINDOBJECPSYHAND = "ObjectPsyHand"
Classic.NAMEOBJECPSYHAND = "ObjectPsyHand"
function CObjectPsyHand:new(_argt)
    CObjectPsyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECPSYHAND
    self.name = Classic.NAMEOBJECPSYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectPsyHand = CObjectPsy:extend() -- generic psy hand objects
Classic.KINDOBJECPSYHAND = "ObjectPsyHand"
Classic.NAMEOBJECPSYHAND = "ObjectPsyHand"
function CObjectPsyHand:new(_argt)
    CObjectPsyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECPSYHAND
    self.name = Classic.NAMEOBJECPSYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectPsyHead = CObjectPsy:extend() -- generic psy head objects
Classic.KINDOBJECTPSYHEAD = "ObjectPsyHead"
Classic.NAMEOBJECTPSYHEAD = "ObjectPsyHead"
function CObjectPsyHead:new(_argt)
    CObjectPsyHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPSYHEAD
    self.name = Classic.NAMEOBJECTPSYHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectPsyBack = CObjectPsy:extend() -- generic psy back objects
Classic.KINDOBJECTPSYBACK = "ObjectPsyBack"
Classic.NAMEOBJECTPSYBACK = "ObjectPsyBack"
function CObjectPsyBack:new(_argt)
    CObjectPsyBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPSYBACK
    self.name = Classic.NAMEOBJECTPSYBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectPsyNone = CObjectPsy:extend() -- generic psy none objects
Classic.KINDOBJECTPSYNONE = "ObjectPsyNone"
Classic.NAMEOBJECTPSYNONE = "ObjectPsyNone"
function CObjectPsyNone:new(_argt)
    CObjectPsyNone.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPSYNONE
    self.name = Classic.NAMEOBJECTPSYNONE
    self.slottype = nil
    self:argt(_argt) -- override if any
end


--
-- CObjectAny
--
CObjectAny = CObjectInventory:extend() -- generic any objects
Classic.KINDOBJECTANY = "ObjectAny"
Classic.NAMEOBJECTANY = "ObjectAny"
function CObjectAny:new(_argt)
    CObjectAny.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTANY
    self.name = Classic.NAMEOBJECTANY
    self.inventorytype = CInventoryAny
    self:argt(_argt) -- override if any
end

CObjectAnyHand = CObjectAny:extend() -- generic any hand objects
Classic.KINDOBJECANYHAND = "ObjectAnyHand"
Classic.NAMEOBJECANYHAND = "ObjectAnyHand"
function CObjectAnyHand:new(_argt)
    CObjectAnyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECANYHAND
    self.name = Classic.NAMEOBJECANYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectAnyHand = CObjectAny:extend() -- generic any hand objects
Classic.KINDOBJECANYHAND = "ObjectAnyHand"
Classic.NAMEOBJECANYHAND = "ObjectAnyHand"
function CObjectAnyHand:new(_argt)
    CObjectAnyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECANYHAND
    self.name = Classic.NAMEOBJECANYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectAnyHead = CObjectAny:extend() -- generic any head objects
Classic.KINDOBJECTANYHEAD = "ObjectAnyHead"
Classic.NAMEOBJECTANYHEAD = "ObjectAnyHead"
function CObjectAnyHead:new(_argt)
    CObjectAnyHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTANYHEAD
    self.name = Classic.NAMEOBJECTANYHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectAnyBack = CObjectAny:extend() -- generic any back objects
Classic.KINDOBJECTANYBACK = "ObjectAnyBack"
Classic.NAMEOBJECTANYBACK = "ObjectAnyBack"
function CObjectAnyBack:new(_argt)
    CObjectAnyBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTANYBACK
    self.name = Classic.NAMEOBJECTANYBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectAnyNone = CObjectAny:extend() -- generic any none objects
Classic.KINDOBJECTANYNONE = "ObjectAnyNone"
Classic.NAMEOBJECTANYNONE = "ObjectAnyNone"
function CObjectAnyNone:new(_argt)
    CObjectAnyNone.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTANYNONE
    self.name = Classic.NAMEOBJECTANYNONE
    self.slottype = nil
    self:argt(_argt) -- override if any
end


--
-- IObjectHandAttack
--
IObjectHandAttack = Classic:extend{ -- hand attack objects implementation
    stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPNONE},
        [Tic.STATEIDLERG]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPHORI},
        [Tic.STATEMOVELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEMOVERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEWORKLF]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPNONE},
        [Tic.STATEWORKRG]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPHORI},
        [Tic.STATEFLOORLF] = {rotate = Tic.ROTATE270, flip = Tic.FLIPNONE},
        [Tic.STATEFLOORRG] = {rotate = Tic.ROTATE270, flip = Tic.FLIPHORI},
    },
    handleoffsets = {
        [Tic.ROTATE000] = {handlex = 3, handley = 5},
        [Tic.ROTATE090] = {handlex = 2, handley = 3},
        [Tic.ROTATE180] = {handlex = 4, handley = 2},
        [Tic.ROTATE270] = {handlex = 5, handley = 4},
    },
    palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONFG,
        [CObject.INSIDE] = CObject.COLORWOODFG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
    },
    palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORWOODBG,
        [CObject.EFFECT] = CObject.COLORWOODBG,
    },
}

--
-- IObjectHandDefense
--
IObjectHandDefense = Classic:extend{ -- hand defense objects implementation
    stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEIDLERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEMOVELF]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPNONE},
        [Tic.STATEMOVERG]  = {rotate = Tic.ROTATE090, flip = Tic.FLIPVERT},
        [Tic.STATEWORKLF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEWORKRG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEFLOORLF] = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEFLOORRG] = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
    },
    handleoffsets = {
        [Tic.ROTATE000] = {handlex = 3, handley = 3},
        [Tic.ROTATE090] = {handlex = 4, handley = 3},
        [Tic.ROTATE180] = {handlex = 4, handley = 4},
        [Tic.ROTATE270] = {handlex = 3, handley = 4},
    },
    palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONFG,
        [CObject.INSIDE] = CObject.COLORWOODFG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
    },
    palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORWOODBG,
        [CObject.EFFECT] = CObject.COLORWOODBG,
    },
}

--
-- IObjectHead
--
IObjectHead = Classic:extend{ -- head objects implementation
    stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEIDLERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEMOVELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEMOVERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEWORKLF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEWORKRG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEFLOORLF] = {rotate = Tic.ROTATE090, flip = Tic.FLIPNONE},
        [Tic.STATEFLOORRG] = {rotate = Tic.ROTATE090, flip = Tic.FLIPHORI},
    },
    handleoffsets = {
        [Tic.ROTATE000] = {handlex = 4, handley = 4},
        [Tic.ROTATE090] = {handlex = 3, handley = 4},
        [Tic.ROTATE180] = {handlex = 3, handley = 3},
        [Tic.ROTATE270] = {handlex = 4, handley = 3},
    },
    palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORLEATHERBG,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
    },
}

--
-- IObjectBack
--
IObjectBack = Classic:extend{ -- back objects implementation
    stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEIDLERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEMOVELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEMOVERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEWORKLF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEWORKRG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEFLOORLF] = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEFLOORRG] = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
    },
    handleoffsets = {
        [Tic.ROTATE000] = {handlex = 1, handley = 3},
        [Tic.ROTATE090] = {handlex = 4, handley = 1},
        [Tic.ROTATE180] = {handlex = 6, handley = 4},
        [Tic.ROTATE270] = {handlex = 3, handley = 6},
    },
    palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORLEATHERBG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
        [CObject.EXTRA1] = CObject.COLORLEATHERBG,
    },
} 

--
-- IObjectUsable
--
IObjectUsable = Classic:extend{ -- usable objects implementation
    stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEIDLERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEMOVELF]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPNONE},
        [Tic.STATEMOVERG]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPHORI},
        [Tic.STATEWORKLF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEWORKRG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEFLOORLF] = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEFLOORRG] = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
    },
}
function IObjectUsable:draw()
    self:save()
    self.palettefg[CObject.USED1] = self.palettefg[CObject.INSIDE]
    self.palettefg[CObject.USED2] = self.palettefg[CObject.EFFECT]
    self.palettebg[CObject.USED1] = self.palettebg[CObject.INSIDE]
    self.palettebg[CObject.USED2] = self.palettebg[CObject.EFFECT]
    if self.used == CObject.USEDHALF then
        self.palettefg[CObject.EFFECT] = Tic.COLORKEY
        self.palettebg[CObject.EFFECT] = Tic.COLORKEY
    elseif self.used == CObject.USEDFULL then
        self.palettefg[CObject.EFFECT] = Tic.COLORKEY
        self.palettebg[CObject.EFFECT] = Tic.COLORKEY
        self.palettefg[CObject.INSIDE] = Tic.COLORKEY
        self.palettebg[CObject.INSIDE] = Tic.COLORKEY
    end
    CObject.super.draw(self)
    self:load()
end




--
-- CWeaponMelee PHY HAND
--
CWeaponMelee = CObjectPhyHand:extend() -- Melee weapons
Classic.KINDDWEAPONMELEE = "Melee"
Classic.NAMEDWEAPONMELEE = "Melee"
function CWeaponMelee:new(_argt)
    CWeaponMelee.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONMELEE
    self.name = Classic.NAMEDWEAPONMELEE
    self.sprite  = CSpriteFG.WEAPONMELEE
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandAttack)
end

CWeaponSword = CWeaponMelee:extend() -- Sword weapons
Classic.KINDDWEAPONSWORD = "Sword"
Classic.NAMEDWEAPONSWORD = "Sword"
function CWeaponSword:new(_argt)
    CWeaponSword.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONSWORD
    self.name = Classic.NAMEDWEAPONSWORD
    self.sprite  = CSpriteFG.WEAPONMSWRD
    self:argt(_argt) -- override if any
end

CWeaponHammer = CWeaponMelee:extend() -- Hammer weapons
Classic.KINDDWEAPONHAMMR= "Hammer"
Classic.NAMEDWEAPONHAMMR= "Hammer"
function CWeaponHammer:new(_argt)
    CWeaponHammer.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONHAMMR
    self.name = Classic.NAMEDWEAPONHAMMR
    self.sprite  = CSpriteFG.WEAPONMHAMR
    self.handleoffsets = {
        [Tic.ROTATE000] = {handlex = 4, handley = 5},
        [Tic.ROTATE090] = {handlex = 2, handley = 4},
        [Tic.ROTATE180] = {handlex = 3, handley = 2},
        [Tic.ROTATE270] = {handlex = 5, handley = 3},
    }
    self:argt(_argt) -- override if any
end

CWeaponLance = CWeaponMelee:extend() -- Lance weapons
Classic.KINDDWEAPONLANCE = "Lance"
Classic.NAMEDWEAPONLANCE = "Lance"
function CWeaponLance:new(_argt)
    CWeaponLance.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONLANCE
    self.name = Classic.NAMEDWEAPONLANCE
    self.sprite  = CSpriteFG.WEAPONMLNCE
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODFG,
        [CObject.INSIDE] = CObject.COLORIRONBG,
        [CObject.EFFECT] = CObject.COLORIRONFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODBG,
        [CObject.INSIDE] = CObject.COLORONYXBG,
        [CObject.EFFECT] = CObject.COLORONYXFG,
    }
    self:argt(_argt) -- override if any
end


--
-- CWeaponShield PHY HAND
--
CWeaponShield = CObjectPhyHand:extend() -- Shield weapons
Classic.KINDDWEAPONSHIELD = "Shield"
Classic.NAMEDWEAPONSHIELD = "Shield"
function CWeaponShield:new(_argt)
    CWeaponShield.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONSHIELD
    self.name = Classic.NAMEDWEAPONSHIELD
    self.sprite  = CSpriteFG.WEAPONSHLDB
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandDefense)
end

CWeaponShieldSmall = CWeaponShield:extend() -- ShieldSmall weapons
Classic.KINDWEAPONSHIELDSMALL = "Ecu.S"
Classic.NAMEWEAPONSHIELDSMALL = "Ecu.S"
function CWeaponShieldSmall:new(_argt)
    CWeaponShieldSmall.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDSMALL
    self.name = Classic.KINDWEAPONSHIELDSMALL
    self.sprite = CSpriteFG.WEAPONSHLDS
    self:argt(_argt) -- override if any
end

CWeaponShieldMedium = CWeaponShield:extend() -- ShieldMedium weapons
Classic.KINDWEAPONSHIELDMEDIUM= "Ecu.M"
Classic.NAMEWEAPONSHIELDMEDIUM= "Ecu.M"
function CWeaponShieldMedium:new(_argt)
    CWeaponShieldMedium.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDMEDIUM
    self.name = Classic.NAMEWEAPONSHIELDMEDIUM
    self.sprite = CSpriteFG.WEAPONSHLDM
    self:argt(_argt) -- override if any
end

CWeaponShieldLarge = CWeaponShield:extend() -- ShieldLarge weapons
Classic.KINDWEAPONSHIELDLARGE= "Ecu.L"
Classic.NAMEWEAPONSHIELDLARGE= "Ecu.L"
function CWeaponShieldLarge:new(_argt)
    CWeaponShieldLarge.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDLARGE
    self.name = Classic.NAMEWEAPONSHIELDLARGE
    self.sprite = CSpriteFG.WEAPONSHLDL
    self:argt(_argt) -- override if any
end


--
-- CClothesHelmet PHY HEAD
--
CClothesHelmet = CObjectPhyHead:extend() -- Helmet objects
Classic.KINDCLOTHESHELMET = "Helmet"
Classic.NAMECLOTHESHELMET = "Helmet"
function CClothesHelmet:new(_argt)
    CClothesHelmet.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMET
    self.name = Classic.NAMECLOTHESHELMET
    self.sprite = CSpriteFG.CLOTHESHLMB
    self.palettefg = {
        [CObject.HANDLE] = CObject.COLORLEATHERFG,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        [CObject.EFFECT] = CObject.COLORPHYM,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHead)
end

CClothesHelmetSmall = CClothesHelmet:extend() -- HelmetSmall objects
Classic.KINDCLOTHESHELMETSMALL = "Helm.S"
Classic.NAMECLOTHESHELMETSMALL = "Helm.S"
function CClothesHelmetSmall:new(_argt)
    CClothesHelmetSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETSMALL
    self.name = Classic.NAMECLOTHESHELMETSMALL
    self.sprite = CSpriteFG.CLOTHESHLMS
    self:argt(_argt) -- override if any
end

CClothesHelmetMedium = CClothesHelmet:extend() -- HelmetMedium objects
Classic.KINDCLOTHESHELMETMEDIUM = "Helm.M"
Classic.NAMECLOTHESHELMETMEDIUM = "Helm.M"
function CClothesHelmetMedium:new(_argt)
    CClothesHelmetMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETMEDIUM
    self.name = Classic.NAMECLOTHESHELMETMEDIUM
    self.sprite = CSpriteFG.CLOTHESHLMM
    self:argt(_argt) -- override if any
end

CClothesHelmetLarge = CClothesHelmet:extend() -- HelmetLarge objects
Classic.KINDCLOTHESHELMETLARGE = "Helm.L"
Classic.NAMECLOTHESHELMETLARGE = "Helm.L"
function CClothesHelmetLarge:new(_argt)
    CClothesHelmetLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETLARGE
    self.name = Classic.NAMECLOTHESHELMETLARGE
    self.sprite = CSpriteFG.CLOTHESHLML
    self:argt(_argt) -- override if any
end


--
-- CClothesBackPack PHY BACK
--
CClothesBackPack = CObjectPhyBack:extend() -- BackPack objects
Classic.KINDCLOTHESBACKPACK = "Bag"
Classic.NAMECLOTHESBACKPACK = "Bag"
function CClothesBackPack:new(_argt)
    CClothesBackPack.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACK
    self.name = Classic.NAMECLOTHESBACKPACK
    self.sprite    = CSpriteFG.CLOTHESBKPB
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
    self:implementnew(IObjectBack)
end

CClothesBackPackSmall = CClothesBackPack:extend() -- BackPackSmall objects
Classic.KINDCLOTHESBACKPACKSMALL = "Bag.S"
Classic.NAMECLOTHESBACKPACKSMALL = "Bag.S"
function CClothesBackPackSmall:new(_argt)
    CClothesBackPackSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKSMALL
    self.name = Classic.NAMECLOTHESBACKPACKSMALL
    self.sprite    = CSpriteFG.CLOTHESBKPS
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesBackPackMedium = CClothesBackPack:extend() -- BackPackMedium objects
Classic.KINDCLOTHESBACKPACKMEDIUM = "Bag.M"
Classic.NAMECLOTHESBACKPACKMEDIUM = "Bag.M"
function CClothesBackPackMedium:new(_argt)
    CClothesBackPackMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKMEDIUM
    self.name = Classic.NAMECLOTHESBACKPACKMEDIUM
    self.sprite    = CSpriteFG.CLOTHESBKPM
    self.inventory = CInventoryAny4{}
    self:argt(_argt) -- override if any
end

CClothesBackPackLarge = CClothesBackPack:extend() -- BackPackLarge objects
Classic.KINDCLOTHESBACKPACKLARGE = "Bag.L"
Classic.NAMECLOTHESBACKPACKLARGE = "Bag.L"
function CClothesBackPackLarge:new(_argt)
    CClothesBackPackLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKLARGE
    self.name = Classic.NAMECLOTHESBACKPACKLARGE
    self.sprite    = CSpriteFG.CLOTHESBKPL
    self.inventory = CInventoryAny6{}
    self:argt(_argt) -- override if any
end


--
-- CObjectBomb PHY HAND
--
CObjectBomb = CObjectPhyHand:extend() -- Bomb objects
Classic.KINDDOBJECTBOMB = "Bomb"
Classic.NAMEDOBJECTBOMB = "Bomb"
function CObjectBomb:new(_argt)
    CObjectBomb.super.new(self, _argt)
    self.kind = Classic.KINDDOBJECTBOMB
    self.name = Classic.NAMEDOBJECTBOMB
    self.sprite  = CSpriteFG.OBJECTBOMBB
    self.handleoffsets = {
        [Tic.ROTATE000] = {handlex = 4, handley = 2},
        [Tic.ROTATE090] = {handlex = 5, handley = 4},
        [Tic.ROTATE180] = {handlex = 3, handley = 5},
        [Tic.ROTATE270] = {handlex = 2, handley = 3},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORONYXBG,
        [CObject.INSIDE] = CObject.COLORONYXFG,
        [CObject.EFFECT] = CObject.COLORONYXFG,
        [CObject.EXTRA1] = CObject.COLORFIREFG,
        [CObject.EXTRA2] = CObject.COLORIRONFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORONYXBG,
        [CObject.INSIDE] = CObject.COLORONYXBG,
        [CObject.EFFECT] = CObject.COLORONYXBG,
        [CObject.EXTRA1] = CObject.COLORFIREBG,
        [CObject.EXTRA2] = CObject.COLORIRONBG,
    }
    self:argt(_argt) -- override if any
    self:implementall(IObjectUsable)
end

CObjectBombSmall = CObjectBomb:extend() -- BombSmall objects
Classic.KINDOBJECTBOMBSMALL = "Bomb.S"
Classic.NAMEOBJECTBOMBSMALL = "Bomb.S"
function CObjectBombSmall:new(_argt)
    CObjectBombSmall.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTBOMBSMALL
    self.name = Classic.NAMEOBJECTBOMBSMALL
    self.sprite  = CSpriteFG.OBJECTBOMBS
    self:argt(_argt) -- override if any
end

CObjectBombMedium = CObjectBomb:extend() -- BombMedium objects
Classic.KINDOBJECTBOMBMEDIUM = "Bomb.M"
Classic.NAMEOBJECTBOMBMEDIUM = "Bomb.M"
function CObjectBombMedium:new(_argt)
    CObjectBombMedium.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTBOMBMEDIUM
    self.name = Classic.NAMEOBJECTBOMBMEDIUM
    self.sprite  = CSpriteFG.OBJECTBOMBM
    self:argt(_argt) -- override if any
end

CObjectBombLarge = CObjectBomb:extend() -- BombLarge objects
Classic.KINDOBJECTBOMBLARGE = "Bomb.L"
Classic.NAMEOBJECTBOMBLARGE = "Bomb.L"
function CObjectBombLarge:new(_argt)
    CObjectBombLarge.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTBOMBLARGE
    self.name = Classic.NAMEOBJECTBOMBLARGE
    self.sprite  = CSpriteFG.OBJECTBOMBL
    self:argt(_argt) -- override if any
end


--
-- CWeaponRange MEN HAND
--
CWeaponRange = CObjectMenHand:extend() -- Range weapons
Classic.KINDDWEAPONRANGE = "Range"
Classic.NAMEDWEAPONRANGE = "Range"
function CWeaponRange:new(_argt)
    CWeaponRange.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONRANGE
    self.name = Classic.NAMEDWEAPONRANGE
    self.sprite  = CSpriteFG.WEAPONRANGE
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPNONE},
        [Tic.STATEIDLERG]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPHORI},
        [Tic.STATEMOVELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEMOVERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEWORKLF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEWORKRG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEFLOORLF] = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEFLOORRG] = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
    }
    self.handleoffsets = {
        [Tic.ROTATE000] = {handlex = 4, handley = 3},
        [Tic.ROTATE090] = {handlex = 4, handley = 4},
        [Tic.ROTATE180] = {handlex = 3, handley = 4},
        [Tic.ROTATE270] = {handlex = 3, handley = 3},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODFG,
        [CObject.INSIDE] = CObject.COLORIRONBG,
        [CObject.EFFECT] = CObject.COLORIRONFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODBG,
        [CObject.INSIDE] = CObject.COLORONYXBG,
        [CObject.EFFECT] = CObject.COLORONYXFG,
    }
    self:argt(_argt) -- override if any
end

CWeaponBowSmall = CWeaponRange:extend() -- BowSmall weapons
Classic.KINDDWEAPONBOWSMALL = "Bow.S"
Classic.NAMEDWEAPONBOWSMALL = "Bow.S"
function CWeaponBowSmall:new(_argt)
    CWeaponBowSmall.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWSMALL
    self.name = Classic.NAMEDWEAPONBOWSMALL
    self.sprite  = CSpriteFG.WEAPONRBOWS
    self:argt(_argt) -- override if any
end

CWeaponBowMedium = CWeaponRange:extend() -- BowMedium weapons
Classic.KINDDWEAPONBOWMEDIUM = "Bow.M"
Classic.NAMEDWEAPONBOWMEDIUM = "Bow.M"
function CWeaponBowMedium:new(_argt)
    CWeaponBowMedium.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWMEDIUM
    self.name = Classic.NAMEDWEAPONBOWMEDIUM
    self.sprite  = CSpriteFG.WEAPONRBOWM
    self:argt(_argt) -- override if any
end

CWeaponBowLarge = CWeaponRange:extend() -- BowLarge weapons
Classic.KINDDWEAPONBOWLARGE = "Bow.L"
Classic.NAMEDWEAPONBOWLARGE = "Bow.L"
function CWeaponBowLarge:new(_argt)
    CWeaponBowLarge.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWLARGE
    self.name = Classic.NAMEDWEAPONBOWLARGE
    self.sprite  = CSpriteFG.WEAPONRBOWL
    self:argt(_argt) -- override if any
end


--
-- CWeaponBook MEN HAND
--
CWeaponBook = CObjectMenHand:extend() -- Book weapons
Classic.KINDDWEAPONBOOK = "Book"
Classic.NAMEDWEAPONBOOK = "Book"
function CWeaponBook:new(_argt)
    CWeaponBook.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOOK
    self.name = Classic.NAMEDWEAPONBOOK
    self.sprite  = CSpriteFG.WEAPONBOOKB
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPNONE},
        [Tic.STATEIDLERG]  = {rotate = Tic.ROTATE270, flip = Tic.FLIPHORI},
        [Tic.STATEMOVELF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEMOVERG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEWORKLF]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEWORKRG]  = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
        [Tic.STATEFLOORLF] = {rotate = Tic.ROTATE000, flip = Tic.FLIPNONE},
        [Tic.STATEFLOORRG] = {rotate = Tic.ROTATE000, flip = Tic.FLIPHORI},
    }
    self.handleoffsets = {
        [Tic.ROTATE000] = {handlex = 6, handley = 2},
        [Tic.ROTATE090] = {handlex = 5, handley = 6},
        [Tic.ROTATE180] = {handlex = 1, handley = 5},
        [Tic.ROTATE270] = {handlex = 2, handley = 1},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.COLORIRONFG,
        [CObject.BORDER] = CObject.COLORIRONFG,
        [CObject.INSIDE] = CObject.COLORLEATHERBG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
        [CObject.EXTRA1] = CObject.COLORONYXFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.COLORIRONBG,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORLEATHERXG,
        [CObject.EFFECT] = CObject.COLORLEATHERBG,
        [CObject.EXTRA1] = CObject.COLORONYXBG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandDefense)
end

CWeaponBookSmall = CWeaponBook:extend() -- BookSmall weapons
Classic.KINDWEAPONBOOKSMALL = "Book.S"
Classic.NAMEWEAPONBOOKSMALL = "Book.S"
function CWeaponBookSmall:new(_argt)
    CWeaponBookSmall.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONBOOKSMALL
    self.name = Classic.KINDWEAPONBOOKSMALL
    self.sprite = CSpriteFG.WEAPONBOOKS
    self:argt(_argt) -- override if any
end

CWeaponBookMedium = CWeaponBook:extend() -- BookMedium weapons
Classic.KINDWEAPONBOOKMEDIUM= "Book.M"
Classic.NAMEWEAPONBOOKMEDIUM= "Book.M"
function CWeaponBookMedium:new(_argt)
    CWeaponBookMedium.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONBOOKMEDIUM
    self.name = Classic.NAMEWEAPONBOOKMEDIUM
    self.sprite = CSpriteFG.WEAPONBOOKM
    self:argt(_argt) -- override if any
end

CWeaponBookLarge = CWeaponBook:extend() -- BookLarge weapons
Classic.KINDWEAPONBOOKLARGE= "Book.L"
Classic.NAMEWEAPONBOOKLARGE= "Book.L"
function CWeaponBookLarge:new(_argt)
    CWeaponBookLarge.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONBOOKLARGE
    self.name = Classic.NAMEWEAPONBOOKLARGE
    self.sprite = CSpriteFG.WEAPONBOOKL
    self:argt(_argt) -- override if any
end


--
-- CClothesHat MEN HEAD
--
CClothesHat = CObjectMenHead:extend() -- Hat objects
Classic.KINDCLOTHESHAT = "Hat"
Classic.NAMECLOTHESHAT = "Hat"
function CClothesHat:new(_argt)
    CClothesHat.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHAT
    self.name = Classic.NAMECLOTHESHAT
    self.sprite = CSpriteFG.CLOTHESHATB
    self.palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORMEND,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHead)
end

CClothesHatSmall = CClothesHat:extend() -- HatSmall objects
Classic.KINDCLOTHESHATSMALL = "Hat.S"
Classic.NAMECLOTHESHATSMALL = "Hat.S"
function CClothesHatSmall:new(_argt)
    CClothesHatSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATSMALL
    self.name = Classic.NAMECLOTHESHATSMALL
    self.sprite = CSpriteFG.CLOTHESHATS
    self:argt(_argt) -- override if any
end

CClothesHatMedium = CClothesHat:extend() -- HatMedium objects
Classic.KINDCLOTHESHATMEDIUM = "Hat.M"
Classic.NAMECLOTHESHATMEDIUM = "Hat.M"
function CClothesHatMedium:new(_argt)
    CClothesHatMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATMEDIUM
    self.name = Classic.NAMECLOTHESHATMEDIUM
    self.sprite = CSpriteFG.CLOTHESHATM
    self:argt(_argt) -- override if any
end

CClothesHatLarge = CClothesHat:extend() -- HatLarge objects
Classic.KINDCLOTHESHATLARGE = "Hat.L"
Classic.NAMECLOTHESHATLARGE = "Hat.L"
function CClothesHatLarge:new(_argt)
    CClothesHatLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATLARGE
    self.name = Classic.NAMECLOTHESHATLARGE
    self.sprite = CSpriteFG.CLOTHESHATL
    self:argt(_argt) -- override if any
end


--
-- CClothesToolBox MEN BACK
--
CClothesToolBox = CObjectMenBack:extend() -- ToolBox objects
Classic.KINDCLOTHESTOOLBOX = "Box"
Classic.NAMECLOTHESTOOLBOX = "Box"
function CClothesToolBox:new(_argt)
    CClothesToolBox.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESTOOLBOX
    self.name = Classic.NAMECLOTHESTOOLBOX
    self.sprite    = CSpriteFG.CLOTHESTBXB
    self.inventory = CInventoryAny2{}
    self.palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORONYXFG,
        [CObject.INSIDE] = CObject.COLORWOODBG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
        [CObject.EXTRA1] = CObject.COLORONYXBG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectBack)
end

CClothesToolBoxSmall = CClothesToolBox:extend() -- ToolBoxSmall objects
Classic.KINDCLOTHESTOOLBOXSMALL = "Box.S"
Classic.NAMECLOTHESTOOLBOXSMALL = "Box.S"
function CClothesToolBoxSmall:new(_argt)
    CClothesToolBoxSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESTOOLBOXSMALL
    self.name = Classic.NAMECLOTHESTOOLBOXSMALL
    self.sprite    = CSpriteFG.CLOTHESTBXS
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesToolBoxMedium = CClothesToolBox:extend() -- ToolBoxMedium objects
Classic.KINDCLOTHESTOOLBOXMEDIUM = "Box.M"
Classic.NAMECLOTHESTOOLBOXMEDIUM = "Box.M"
function CClothesToolBoxMedium:new(_argt)
    CClothesToolBoxMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESTOOLBOXMEDIUM
    self.name = Classic.NAMECLOTHESTOOLBOXMEDIUM
    self.sprite    = CSpriteFG.CLOTHESTBXM
    self.inventory = CInventoryAny4{}
    self:argt(_argt) -- override if any
end

CClothesToolBoxLarge = CClothesToolBox:extend() -- ToolBoxLarge objects
Classic.KINDCLOTHESTOOLBOXLARGE = "Box.L"
Classic.NAMECLOTHESTOOLBOXLARGE = "Box.L"
function CClothesToolBoxLarge:new(_argt)
    CClothesToolBoxLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESTOOLBOXLARGE
    self.name = Classic.NAMECLOTHESTOOLBOXLARGE
    self.sprite    = CSpriteFG.CLOTHESTBXL
    self.inventory = CInventoryAny6{}
    self:argt(_argt) -- override if any
end


--
-- CObjectFlask MEN HAND
--
CObjectFlask = CObjectMenHand:extend() -- Flask objects
Classic.KINDDOBJECTFLASK = "Flask"
Classic.NAMEDOBJECTFLASK = "Flask"
function CObjectFlask:new(_argt)
    CObjectFlask.super.new(self, _argt)
    self.kind = Classic.KINDDOBJECTFLASK
    self.name = Classic.NAMEDOBJECTFLASK
    self.sprite  = CSpriteFG.OBJECTFLASB
    self.handleoffsets = {
        [Tic.ROTATE000] = {handlex = 3, handley = 1},
        [Tic.ROTATE090] = {handlex = 6, handley = 3},
        [Tic.ROTATE180] = {handlex = 4, handley = 6},
        [Tic.ROTATE270] = {handlex = 1, handley = 4},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORFLASKG,
        [CObject.INSIDE] = CObject.COLORWOODFG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORFLASKG,
        [CObject.INSIDE] = CObject.COLORWOODBG,
        [CObject.EFFECT] = CObject.COLORWOODBG,
    }
    self:argt(_argt) -- override if any
    self:implementall(IObjectUsable)
end

CObjectFlaskSmall = CObjectFlask:extend() -- FlaskSmall objects
Classic.KINDOBJECTFLASKSMALL = "Flask.S"
Classic.NAMEOBJECTFLASKSMALL = "Flask.S"
function CObjectFlaskSmall:new(_argt)
    CObjectFlaskSmall.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKSMALL
    self.name = Classic.NAMEOBJECTFLASKSMALL
    self.sprite  = CSpriteFG.OBJECTFLASS
    self:argt(_argt) -- override if any
end

CObjectFlaskMedium = CObjectFlask:extend() -- FlaskMedium objects
Classic.KINDOBJECTFLASKMEDIUM = "Flask.M"
Classic.NAMEOBJECTFLASKMEDIUM = "Flask.M"
function CObjectFlaskMedium:new(_argt)
    CObjectFlaskMedium.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKMEDIUM
    self.name = Classic.NAMEOBJECTFLASKMEDIUM
    self.sprite  = CSpriteFG.OBJECTFLASM
    self:argt(_argt) -- override if any
end

CObjectFlaskLarge = CObjectFlask:extend() -- FlaskLarge objects
Classic.KINDOBJECTFLASKLARGE = "Flask.L"
Classic.NAMEOBJECTFLASKLARGE = "Flask.L"
function CObjectFlaskLarge:new(_argt)
    CObjectFlaskLarge.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKLARGE
    self.name = Classic.NAMEOBJECTFLASKLARGE
    self.sprite  = CSpriteFG.OBJECTFLASL
    self:argt(_argt) -- override if any
end


--
-- CWeaponMagic PSY HAND
--
CWeaponMagic = CObjectPsyHand:extend() -- Magic weapons
Classic.KINDDWEAPONMAGIC = "Magic"
Classic.NAMEDWEAPONMAGIC = "Magic"
function CWeaponMagic:new(_argt)
    CWeaponMagic.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONMAGIC
    self.name = Classic.NAMEDWEAPONMAGIC
    self.sprite  = CSpriteFG.WEAPONMAGIC
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODFG,
        [CObject.INSIDE] = CObject.COLORMAGIC1FG,
        [CObject.EFFECT] = CObject.COLORMAGIC2FG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODBG,
        [CObject.INSIDE] = CObject.COLORMAGIC1BG,
        [CObject.EFFECT] = CObject.COLORMAGIC2BG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandAttack)
end

CWeaponWandSmall = CWeaponMagic:extend() -- WandSmall weapons
Classic.KINDDWEAPONWANDSMALL = "Wand.S"
Classic.NAMEDWEAPONWANDSMALL = "Wand.S"
function CWeaponWandSmall:new(_argt)
    CWeaponWandSmall.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONWANDSMALL
    self.name = Classic.NAMEDWEAPONWANDSMALL
    self.sprite  = CSpriteFG.WEAPONMWNDS
    self:argt(_argt) -- override if any
end

CWeaponWandMedium = CWeaponMagic:extend() -- WandMedium weapons
Classic.KINDDWEAPONWANDMEDIUM = "Wand.M"
Classic.NAMEDWEAPONWANDMEDIUM = "Wand.M"
function CWeaponWandMedium:new(_argt)
    CWeaponWandMedium.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONWANDMEDIUM
    self.name = Classic.NAMEDWEAPONWANDMEDIUM
    self.sprite  = CSpriteFG.WEAPONMWNDM
    self:argt(_argt) -- override if any
end

CWeaponWandLarge = CWeaponMagic:extend() -- WandLarge weapons
Classic.KINDDWEAPONWANDLARGE = "Wand.L"
Classic.NAMEDWEAPONWANDLARGE = "Wand.L"
function CWeaponWandLarge:new(_argt)
    CWeaponWandLarge.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONWANDLARGE
    self.name = Classic.NAMEDWEAPONWANDLARGE
    self.sprite  = CSpriteFG.WEAPONMWNDL
    self:argt(_argt) -- override if any
end


--
-- CWeaponRune PSY HAND
--
CWeaponRune = CObjectPsyHand:extend() -- Rune weapons
Classic.KINDDWEAPONRUNE = "Rune"
Classic.NAMEDWEAPONRUNE = "Rune"
function CWeaponRune:new(_argt)
    CWeaponRune.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONRUNE
    self.name = Classic.NAMEDWEAPONRUNE
    self.sprite  = CSpriteFG.WEAPONRUNEB
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORONYXFG,
        [CObject.INSIDE] = CObject.COLORMAGIC1FG,
        [CObject.EFFECT] = CObject.COLORMAGIC2FG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORONYXBG,
        [CObject.INSIDE] = CObject.COLORMAGIC1BG,
        [CObject.EFFECT] = CObject.COLORMAGIC2BG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandDefense)
end

CWeaponRuneSmall = CWeaponRune:extend() -- RuneSmall weapons
Classic.KINDWEAPONRUNESMALL = "Rune.S"
Classic.NAMEWEAPONRUNESMALL = "Rune.S"
function CWeaponRuneSmall:new(_argt)
    CWeaponRuneSmall.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONRUNESMALL
    self.name = Classic.KINDWEAPONRUNESMALL
    self.sprite = CSpriteFG.WEAPONRUNES
    self:argt(_argt) -- override if any
end

CWeaponRuneMedium = CWeaponRune:extend() -- RuneMedium weapons
Classic.KINDWEAPONRUNEMEDIUM= "Rune.M"
Classic.NAMEWEAPONRUNEMEDIUM= "Rune.M"
function CWeaponRuneMedium:new(_argt)
    CWeaponRuneMedium.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONRUNEMEDIUM
    self.name = Classic.NAMEWEAPONRUNEMEDIUM
    self.sprite = CSpriteFG.WEAPONRUNEM
    self:argt(_argt) -- override if any
end

CWeaponRuneLarge = CWeaponRune:extend() -- RuneLarge weapons
Classic.KINDWEAPONRUNELARGE= "Rune.L"
Classic.NAMEWEAPONRUNELARGE= "Rune.L"
function CWeaponRuneLarge:new(_argt)
    CWeaponRuneLarge.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONRUNELARGE
    self.name = Classic.NAMEWEAPONRUNELARGE
    self.sprite = CSpriteFG.WEAPONRUNEL
    self:argt(_argt) -- override if any
end


--
-- CClothesCap PSY HEAD
--
CClothesCap = CObjectPsyHead:extend() -- Cap objects
Classic.KINDCLOTHESCAP = "Cap"
Classic.NAMECLOTHESCAP = "Cap"
function CClothesCap:new(_argt)
    CClothesCap.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESCAP
    self.name = Classic.NAMECLOTHESCAP
    self.sprite = CSpriteFG.CLOTHESCAPB
    self.palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORPSYM,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        -- [CObject.EFFECT] = CObject.COLORPSYM,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHead)
end

CClothesCapSmall = CClothesCap:extend() -- CapSmall objects
Classic.KINDCLOTHESCAPSMALL = "Cap.S"
Classic.NAMECLOTHESCAPSMALL = "Cap.S"
function CClothesCapSmall:new(_argt)
    CClothesCapSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESCAPSMALL
    self.name = Classic.NAMECLOTHESCAPSMALL
    self.sprite = CSpriteFG.CLOTHESCAPS
    self:argt(_argt) -- override if any
end

CClothesCapMedium = CClothesCap:extend() -- CapMedium objects
Classic.KINDCLOTHESCAPMEDIUM = "Cap.M"
Classic.NAMECLOTHESCAPMEDIUM = "Cap.M"
function CClothesCapMedium:new(_argt)
    CClothesCapMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESCAPMEDIUM
    self.name = Classic.NAMECLOTHESCAPMEDIUM
    self.sprite = CSpriteFG.CLOTHESCAPM
    self:argt(_argt) -- override if any
end

CClothesCapLarge = CClothesCap:extend() -- CapLarge objects
Classic.KINDCLOTHESCAPLARGE = "Cap.L"
Classic.NAMECLOTHESCAPLARGE = "Cap.L"
function CClothesCapLarge:new(_argt)
    CClothesCapLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESCAPLARGE
    self.name = Classic.NAMECLOTHESCAPLARGE
    self.sprite = CSpriteFG.CLOTHESCAPL
    self:argt(_argt) -- override if any
end


--
-- CClothesScrollCase PSY BACK
--
CClothesScrollCase = CObjectPsyBack:extend() -- ScrollCase objects
Classic.KINDCLOTHESSCROLLCASE = "Case"
Classic.NAMECLOTHESSCROLLCASE = "Case"
function CClothesScrollCase:new(_argt)
    CClothesScrollCase.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESSCROLLCASE
    self.name = Classic.NAMECLOTHESSCROLLCASE
    self.sprite    = CSpriteFG.CLOTHESCASB
    self.inventory = CInventoryAny2{}
    self.palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORIRONFG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
        [CObject.EXTRA1] = CObject.COLORWOODBG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectBack)
end

CClothesScrollCaseSmall = CClothesScrollCase:extend() -- ScrollCaseSmall objects
Classic.KINDCLOTHESSCROLLCASESMALL = "Case.S"
Classic.NAMECLOTHESSCROLLCASESMALL = "Case.S"
function CClothesScrollCaseSmall:new(_argt)
    CClothesScrollCaseSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESSCROLLCASESMALL
    self.name = Classic.NAMECLOTHESSCROLLCASESMALL
    self.sprite    = CSpriteFG.CLOTHESCASS
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesScrollCaseMedium = CClothesScrollCase:extend() -- ScrollCaseMedium objects
Classic.KINDCLOTHESSCROLLCASEMEDIUM = "Case.M"
Classic.NAMECLOTHESSCROLLCASEMEDIUM = "Case.M"
function CClothesScrollCaseMedium:new(_argt)
    CClothesScrollCaseMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESSCROLLCASEMEDIUM
    self.name = Classic.NAMECLOTHESSCROLLCASEMEDIUM
    self.sprite    = CSpriteFG.CLOTHESCASM
    self.inventory = CInventoryAny4{}
    self:argt(_argt) -- override if any
end

CClothesScrollCaseLarge = CClothesScrollCase:extend() -- ScrollCaseLarge objects
Classic.KINDCLOTHESSCROLLCASELARGE = "Case.L"
Classic.NAMECLOTHESSCROLLCASELARGE = "Case.L"
function CClothesScrollCaseLarge:new(_argt)
    CClothesScrollCaseLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESSCROLLCASELARGE
    self.name = Classic.NAMECLOTHESSCROLLCASELARGE
    self.sprite    = CSpriteFG.CLOTHESCASL
    self.inventory = CInventoryAny6{}
    self:argt(_argt) -- override if any
end


--
-- CObjectSpell PSY HAND
--
CObjectSpell = CObjectPsyHand:extend() -- Spell objects
Classic.KINDDOBJECTSPELL = "Spell"
Classic.NAMEDOBJECTSPELL = "Spell"
function CObjectSpell:new(_argt)
    CObjectSpell.super.new(self, _argt)
    self.kind = Classic.KINDDOBJECTSPELL
    self.name = Classic.NAMEDOBJECTSPELL
    self.sprite  = CSpriteFG.OBJECTSPELB
    self.handleoffsets = {
        [Tic.ROTATE000] = {handlex = 5, handley = 1},
        [Tic.ROTATE090] = {handlex = 6, handley = 5},
        [Tic.ROTATE180] = {handlex = 2, handley = 6},
        [Tic.ROTATE270] = {handlex = 1, handley = 2},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.COLORONYXFG,
        [CObject.BORDER] = CObject.COLORONYXFG,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
        [CObject.EXTRA1] = CObject.COLORLEATHERBG,
        [CObject.EXTRA2] = CObject.COLORIRONFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.COLORONYXBG,
        [CObject.BORDER] = CObject.COLORONYXBG,
        [CObject.INSIDE] = CObject.COLORLEATHERBG,
        [CObject.EFFECT] = CObject.COLORLEATHERBG,
        [CObject.EXTRA1] = CObject.COLORLEATHERXG,
        [CObject.EXTRA2] = CObject.COLORIRONBG,
    }
    self:argt(_argt) -- override if any
    self:implementall(IObjectUsable)
end

CObjectSpellSmall = CObjectSpell:extend() -- SpellSmall objects
Classic.KINDOBJECTSPELLSMALL = "Spell.S"
Classic.NAMEOBJECTSPELLSMALL = "Spell.S"
function CObjectSpellSmall:new(_argt)
    CObjectSpellSmall.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTSPELLSMALL
    self.name = Classic.NAMEOBJECTSPELLSMALL
    self.sprite  = CSpriteFG.OBJECTSPELS
    self:argt(_argt) -- override if any
end

CObjectSpellMedium = CObjectSpell:extend() -- SpellMedium objects
Classic.KINDOBJECTSPELLMEDIUM = "Spell.M"
Classic.NAMEOBJECTSPELLMEDIUM = "Spell.M"
function CObjectSpellMedium:new(_argt)
    CObjectSpellMedium.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTSPELLMEDIUM
    self.name = Classic.NAMEOBJECTSPELLMEDIUM
    self.sprite  = CSpriteFG.OBJECTSPELM
    self:argt(_argt) -- override if any
end

CObjectSpellLarge = CObjectSpell:extend() -- SpellLarge objects
Classic.KINDOBJECTSPELLLARGE = "Spell.L"
Classic.NAMEOBJECTSPELLLARGE = "Spell.L"
function CObjectSpellLarge:new(_argt)
    CObjectSpellLarge.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTSPELLLARGE
    self.name = Classic.NAMEOBJECTSPELLLARGE
    self.sprite  = CSpriteFG.OBJECTSPELL
    self:argt(_argt) -- override if any
end
