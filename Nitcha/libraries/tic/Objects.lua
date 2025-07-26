--
-- CObject
--
CObject = CEntityDrawable:extend() -- generic objects
Classic.KINDOBJECT = "Object" -- Object kind
Classic.NAMEOBJECT = "Object" -- Object name
CObject.HANDLE         = Tic.COLORWHITE
CObject.BORDER         = Tic.COLORGREYD
CObject.INSIDE         = Tic.COLORGREYM
CObject.EFFECT         = Tic.COLORGREYL
CObject.EXTRA1         = Tic.COLORPURPLE
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
    self.inventory    = nil -- can have an inventory if any
    self:argt(_argt) -- override if any
end


--
-- CObjectMobile
--
CObjectMobile = CObject:extend() -- generic mobile objects
Classic.KINDOBJECTPHY = "ObjectPhy" -- ObjectPhy kind
Classic.NAMEOBJECTPHY = "ObjectPhy" -- ObjectPhy name
function CObjectMobile:new(_argt)
    CObjectMobile.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHY
    self.name = Classic.NAMEOBJECTPHY
    self.hitbox = nil -- no hitbox by default to pick
    self:argt(_argt) -- override if any
end

function CObjectMobile:handleOffsets(_state)
    local _result   = Tables:merge(self.handleoffsets[self.stateshandles[_state].rotate])
    _result.rotate  = self.stateshandles[_state].rotate
    _result.flip    = self.stateshandles[_state].flip
    _result.handlex = (_result.flip == Tic.DIRXLF) -- flip the handlex if any
        and _result.handlex
        or  Tic.SPRITESIZE - 1 - _result.handlex
    return _result
end


--
-- CObjectPhy
--
CObjectPhy = CObjectMobile:extend() -- generic phy objects
Classic.KINDOBJECTPHY = "ObjectPhy" -- ObjectPhy kind
Classic.NAMEOBJECTPHY = "ObjectPhy" -- ObjectPhy name
function CObjectPhy:new(_argt)
    CObjectPhy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHY
    self.name = Classic.NAMEOBJECTPHY
    self.inventorytype = CInventoryPhy
    self:argt(_argt) -- override if any
end

CObjectPhyHand = CObjectPhy:extend() -- generic phy hand objects
Classic.KINDOBJECPHYHAND = "ObjectPhyHand" -- ObjectPhyHand kind
Classic.NAMEOBJECPHYHAND = "ObjectPhyHand" -- ObjectPhyHand name
function CObjectPhyHand:new(_argt)
    CObjectPhyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECPHYHAND
    self.name = Classic.NAMEOBJECPHYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectPhyHead = CObjectPhy:extend() -- generic phy head objects
Classic.KINDOBJECTPHYHEAD = "ObjectPhyHead" -- ObjectPhyHead kind
Classic.NAMEOBJECTPHYHEAD = "ObjectPhyHead" -- ObjectPhyHead name
function CObjectPhyHead:new(_argt)
    CObjectPhyHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHYHEAD
    self.name = Classic.NAMEOBJECTPHYHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectPhyBack = CObjectPhy:extend() -- generic phy back objects
Classic.KINDOBJECTPHYBACK = "ObjectPhyBack" -- ObjectPhyBack kind
Classic.NAMEOBJECTPHYBACK = "ObjectPhyBack" -- ObjectPhyBack name
function CObjectPhyBack:new(_argt)
    CObjectPhyBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPHYBACK
    self.name = Classic.NAMEOBJECTPHYBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectPhyNone = CObjectPhy:extend() -- generic phy none objects
Classic.KINDOBJECTPHYNONE = "ObjectPhyNone" -- ObjectPhyNone kind
Classic.NAMEOBJECTPHYNONE = "ObjectPhyNone" -- ObjectPhyNone name
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
CObjectMen = CObjectMobile:extend() -- generic men objects
Classic.KINDOBJECTMEN = "ObjectMen" -- ObjectMen kind
Classic.NAMEOBJECTMEN = "ObjectMen" -- ObjectMen name
function CObjectMen:new(_argt)
    CObjectMen.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTMEN
    self.name = Classic.NAMEOBJECTMEN
    self.inventorytype = CInventoryMen
    self:argt(_argt) -- override if any
end

CObjectMenHand = CObjectMen:extend() -- generic men hand objects
Classic.KINDOBJECMENHAND = "ObjectMenHand" -- ObjectMenHand kind
Classic.NAMEOBJECMENHAND = "ObjectMenHand" -- ObjectMenHand name
function CObjectMenHand:new(_argt)
    CObjectMenHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECMENHAND
    self.name = Classic.NAMEOBJECMENHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectMenHand = CObjectMen:extend() -- generic men hand objects
Classic.KINDOBJECMENHAND = "ObjectMenHand" -- ObjectMenHand kind
Classic.NAMEOBJECMENHAND = "ObjectMenHand" -- ObjectMenHand name
function CObjectMenHand:new(_argt)
    CObjectMenHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECMENHAND
    self.name = Classic.NAMEOBJECMENHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectMenHead = CObjectMen:extend() -- generic men head objects
Classic.KINDOBJECTMENHEAD = "ObjectMenHead" -- ObjectMenHead kind
Classic.NAMEOBJECTMENHEAD = "ObjectMenHead" -- ObjectMenHead name
function CObjectMenHead:new(_argt)
    CObjectMenHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTMENHEAD
    self.name = Classic.NAMEOBJECTMENHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectMenBack = CObjectMen:extend() -- generic men back objects
Classic.KINDOBJECTMENBACK = "ObjectMenBack" -- ObjectMenBack kind
Classic.NAMEOBJECTMENBACK = "ObjectMenBack" -- ObjectMenBack name
function CObjectMenBack:new(_argt)
    CObjectMenBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTMENBACK
    self.name = Classic.NAMEOBJECTMENBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectMenNone = CObjectMen:extend() -- generic men none objects
Classic.KINDOBJECTMENNONE = "ObjectMenNone" -- ObjectMenNone kind
Classic.NAMEOBJECTMENNONE = "ObjectMenNone" -- ObjectMenNone name
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
CObjectPsy = CObjectMobile:extend() -- generic psy objects
Classic.KINDOBJECTPSY = "ObjectPsy" -- ObjectPsy kind
Classic.NAMEOBJECTPSY = "ObjectPsy" -- ObjectPsy name
function CObjectPsy:new(_argt)
    CObjectPsy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPSY
    self.name = Classic.NAMEOBJECTPSY
    self.inventorytype = CInventoryPsy
    self:argt(_argt) -- override if any
end

CObjectPsyHand = CObjectPsy:extend() -- generic psy hand objects
Classic.KINDOBJECPSYHAND = "ObjectPsyHand" -- ObjectPsyHand kind
Classic.NAMEOBJECPSYHAND = "ObjectPsyHand" -- ObjectPsyHand name
function CObjectPsyHand:new(_argt)
    CObjectPsyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECPSYHAND
    self.name = Classic.NAMEOBJECPSYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectPsyHand = CObjectPsy:extend() -- generic psy hand objects
Classic.KINDOBJECPSYHAND = "ObjectPsyHand" -- ObjectPsyHand kind
Classic.NAMEOBJECPSYHAND = "ObjectPsyHand" -- ObjectPsyHand name
function CObjectPsyHand:new(_argt)
    CObjectPsyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECPSYHAND
    self.name = Classic.NAMEOBJECPSYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectPsyHead = CObjectPsy:extend() -- generic psy head objects
Classic.KINDOBJECTPSYHEAD = "ObjectPsyHead" -- ObjectPsyHead kind
Classic.NAMEOBJECTPSYHEAD = "ObjectPsyHead" -- ObjectPsyHead name
function CObjectPsyHead:new(_argt)
    CObjectPsyHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPSYHEAD
    self.name = Classic.NAMEOBJECTPSYHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectPsyBack = CObjectPsy:extend() -- generic psy back objects
Classic.KINDOBJECTPSYBACK = "ObjectPsyBack" -- ObjectPsyBack kind
Classic.NAMEOBJECTPSYBACK = "ObjectPsyBack" -- ObjectPsyBack name
function CObjectPsyBack:new(_argt)
    CObjectPsyBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTPSYBACK
    self.name = Classic.NAMEOBJECTPSYBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectPsyNone = CObjectPsy:extend() -- generic psy none objects
Classic.KINDOBJECTPSYNONE = "ObjectPsyNone" -- ObjectPsyNone kind
Classic.NAMEOBJECTPSYNONE = "ObjectPsyNone" -- ObjectPsyNone name
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
CObjectAny = CObjectMobile:extend() -- generic any objects
Classic.KINDOBJECTANY = "ObjectAny" -- ObjectAny kind
Classic.NAMEOBJECTANY = "ObjectAny" -- ObjectAny name
function CObjectAny:new(_argt)
    CObjectAny.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTANY
    self.name = Classic.NAMEOBJECTANY
    self.inventorytype = CInventoryAny
    self:argt(_argt) -- override if any
end

CObjectAnyHand = CObjectAny:extend() -- generic any hand objects
Classic.KINDOBJECANYHAND = "ObjectAnyHand" -- ObjectAnyHand kind
Classic.NAMEOBJECANYHAND = "ObjectAnyHand" -- ObjectAnyHand name
function CObjectAnyHand:new(_argt)
    CObjectAnyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECANYHAND
    self.name = Classic.NAMEOBJECANYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectAnyHand = CObjectAny:extend() -- generic any hand objects
Classic.KINDOBJECANYHAND = "ObjectAnyHand" -- ObjectAnyHand kind
Classic.NAMEOBJECANYHAND = "ObjectAnyHand" -- ObjectAnyHand name
function CObjectAnyHand:new(_argt)
    CObjectAnyHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECANYHAND
    self.name = Classic.NAMEOBJECANYHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectAnyHead = CObjectAny:extend() -- generic any head objects
Classic.KINDOBJECTANYHEAD = "ObjectAnyHead" -- ObjectAnyHead kind
Classic.NAMEOBJECTANYHEAD = "ObjectAnyHead" -- ObjectAnyHead name
function CObjectAnyHead:new(_argt)
    CObjectAnyHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTANYHEAD
    self.name = Classic.NAMEOBJECTANYHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CObjectAnyBack = CObjectAny:extend() -- generic any back objects
Classic.KINDOBJECTANYBACK = "ObjectAnyBack" -- ObjectAnyBack kind
Classic.NAMEOBJECTANYBACK = "ObjectAnyBack" -- ObjectAnyBack name
function CObjectAnyBack:new(_argt)
    CObjectAnyBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTANYBACK
    self.name = Classic.NAMEOBJECTANYBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CObjectAnyNone = CObjectAny:extend() -- generic any none objects
Classic.KINDOBJECTANYNONE = "ObjectAnyNone" -- ObjectAnyNone kind
Classic.NAMEOBJECTANYNONE = "ObjectAnyNone" -- ObjectAnyNone name
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
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
    },
    handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 3, handley = 5},
        [CSprite.ROTATE090] = {handlex = 2, handley = 3},
        [CSprite.ROTATE180] = {handlex = 4, handley = 2},
        [CSprite.ROTATE270] = {handlex = 5, handley = 4},
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
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    },
    handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 3, handley = 3},
        [CSprite.ROTATE090] = {handlex = 4, handley = 3},
        [CSprite.ROTATE180] = {handlex = 4, handley = 4},
        [CSprite.ROTATE270] = {handlex = 3, handley = 4},
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
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE090, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE090, flip = Tic.DIRXRG},
    },
    handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 4, handley = 4},
        [CSprite.ROTATE090] = {handlex = 3, handley = 4},
        [CSprite.ROTATE180] = {handlex = 3, handley = 3},
        [CSprite.ROTATE270] = {handlex = 4, handley = 3},
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
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    },
    handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 1, handley = 3},
        [CSprite.ROTATE090] = {handlex = 4, handley = 1},
        [CSprite.ROTATE180] = {handlex = 6, handley = 4},
        [CSprite.ROTATE270] = {handlex = 3, handley = 6},
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
-- CWeaponMelee PHY HAND
--
CWeaponMelee = CObjectPhyHand:extend() -- Melee weapons
Classic.KINDDWEAPONMELEE = "Melee" -- Melee kind
Classic.NAMEDWEAPONMELEE = "Melee" -- Melee name
function CWeaponMelee:new(_argt)
    CWeaponMelee.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONMELEE
    self.name = Classic.NAMEDWEAPONMELEE
    self.sprite  = CSpriteFG.WEAPONMELEE
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandAttack)
end

CWeaponSword = CWeaponMelee:extend() -- Sword weapons
Classic.KINDDWEAPONSWORD = "Sword" -- Sword kind
Classic.NAMEDWEAPONSWORD = "Sword" -- Sword name
function CWeaponSword:new(_argt)
    CWeaponSword.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONSWORD
    self.name = Classic.NAMEDWEAPONSWORD
    self.sprite  = CSpriteFG.WEAPONMSWRD
    self:argt(_argt) -- override if any
end

CWeaponHammer = CWeaponMelee:extend() -- Hammer weapons
Classic.KINDDWEAPONHAMMR= "Hammer" -- Hammer kind
Classic.NAMEDWEAPONHAMMR= "Hammer" -- Hammer name
function CWeaponHammer:new(_argt)
    CWeaponHammer.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONHAMMR
    self.name = Classic.NAMEDWEAPONHAMMR
    self.sprite  = CSpriteFG.WEAPONMHAMR
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 4, handley = 5},
        [CSprite.ROTATE090] = {handlex = 2, handley = 4},
        [CSprite.ROTATE180] = {handlex = 3, handley = 2},
        [CSprite.ROTATE270] = {handlex = 5, handley = 3},
    }
    self:argt(_argt) -- override if any
end

CWeaponLance = CWeaponMelee:extend() -- Lance weapons
Classic.KINDDWEAPONLANCE = "Lance" -- Lance kind
Classic.NAMEDWEAPONLANCE = "Lance" -- Lance name
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
Classic.KINDDWEAPONSHIELD = "Shield" -- Shield kind
Classic.NAMEDWEAPONSHIELD = "Shield" -- Shield name
function CWeaponShield:new(_argt)
    CWeaponShield.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONSHIELD
    self.name = Classic.NAMEDWEAPONSHIELD
    self.sprite  = CSpriteFG.WEAPONSHLDB
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandDefense)
end

CWeaponShieldSmall = CWeaponShield:extend() -- ShieldSmall weapons
Classic.KINDWEAPONSHIELDSMALL = "Ecu.S" -- ShieldSmall kind
Classic.NAMEWEAPONSHIELDSMALL = "Ecu.S" -- ShieldSmall name
function CWeaponShieldSmall:new(_argt)
    CWeaponShieldSmall.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDSMALL
    self.name = Classic.KINDWEAPONSHIELDSMALL
    self.sprite = CSpriteFG.WEAPONSHLDS
    self:argt(_argt) -- override if any
end

CWeaponShieldMedium = CWeaponShield:extend() -- ShieldMedium weapons
Classic.KINDWEAPONSHIELDMEDIUM= "Ecu.M" -- ShieldMedium kind
Classic.NAMEWEAPONSHIELDMEDIUM= "Ecu.M" -- ShieldMedium name
function CWeaponShieldMedium:new(_argt)
    CWeaponShieldMedium.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDMEDIUM
    self.name = Classic.NAMEWEAPONSHIELDMEDIUM
    self.sprite = CSpriteFG.WEAPONSHLDM
    self:argt(_argt) -- override if any
end

CWeaponShieldLarge = CWeaponShield:extend() -- ShieldLarge weapons
Classic.KINDWEAPONSHIELDLARGE= "Ecu.L" -- ShieldLarge kind
Classic.NAMEWEAPONSHIELDLARGE= "Ecu.L" -- ShieldLarge name
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
Classic.KINDCLOTHESHELMET = "Helmet" -- ClothesHelmet kind
Classic.NAMECLOTHESHELMET = "Helmet" -- ClothesHelmet name
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
Classic.KINDCLOTHESHELMETSMALL = "Helm.S" -- ClothesHelmetSmall kind
Classic.NAMECLOTHESHELMETSMALL = "Helm.S" -- ClothesHelmetSmall name
function CClothesHelmetSmall:new(_argt)
    CClothesHelmetSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETSMALL
    self.name = Classic.NAMECLOTHESHELMETSMALL
    self.sprite = CSpriteFG.CLOTHESHLMS
    self:argt(_argt) -- override if any
end

CClothesHelmetMedium = CClothesHelmet:extend() -- HelmetMedium objects
Classic.KINDCLOTHESHELMETMEDIUM = "Helm.M" -- ClothesHelmetMedium kind
Classic.NAMECLOTHESHELMETMEDIUM = "Helm.M" -- ClothesHelmetMedium name
function CClothesHelmetMedium:new(_argt)
    CClothesHelmetMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETMEDIUM
    self.name = Classic.NAMECLOTHESHELMETMEDIUM
    self.sprite = CSpriteFG.CLOTHESHLMM
    self:argt(_argt) -- override if any
end

CClothesHelmetLarge = CClothesHelmet:extend() -- HelmetLarge objects
Classic.KINDCLOTHESHELMETLARGE = "Helm.L" -- ClothesHelmetLarge kind
Classic.NAMECLOTHESHELMETLARGE = "Helm.L" -- ClothesHelmetLarge name
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
Classic.KINDCLOTHESBACKPACK = "Bag" -- ClothesBackPack kind
Classic.NAMECLOTHESBACKPACK = "Bag" -- ClothesBackPack name
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
Classic.KINDCLOTHESBACKPACKSMALL = "Bag.S" -- ClothesBackPackSmall kind
Classic.NAMECLOTHESBACKPACKSMALL = "Bag.S" -- ClothesBackPackSmall name
function CClothesBackPackSmall:new(_argt)
    CClothesBackPackSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKSMALL
    self.name = Classic.NAMECLOTHESBACKPACKSMALL
    self.sprite    = CSpriteFG.CLOTHESBKPS
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesBackPackMedium = CClothesBackPack:extend() -- BackPackMedium objects
Classic.KINDCLOTHESBACKPACKMEDIUM = "Bag.M" -- ClothesBackPackMedium kind
Classic.NAMECLOTHESBACKPACKMEDIUM = "Bag.M" -- ClothesBackPackMedium name
function CClothesBackPackMedium:new(_argt)
    CClothesBackPackMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKMEDIUM
    self.name = Classic.NAMECLOTHESBACKPACKMEDIUM
    self.sprite    = CSpriteFG.CLOTHESBKPM
    self.inventory = CInventoryAny4{}
    self:argt(_argt) -- override if any
end

CClothesBackPackLarge = CClothesBackPack:extend() -- BackPackLarge objects
Classic.KINDCLOTHESBACKPACKLARGE = "Bag.L" -- ClothesBackPackLarge kind
Classic.NAMECLOTHESBACKPACKLARGE = "Bag.L" -- ClothesBackPackLarge name
function CClothesBackPackLarge:new(_argt)
    CClothesBackPackLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKLARGE
    self.name = Classic.NAMECLOTHESBACKPACKLARGE
    self.sprite    = CSpriteFG.CLOTHESBKPL
    self.inventory = CInventoryAny6{}
    self:argt(_argt) -- override if any
end


--
-- CWeaponRange MEN HAND
--
CWeaponRange = CObjectMenHand:extend() -- Range weapons
Classic.KINDDWEAPONRANGE = "Range" -- Range kind
Classic.NAMEDWEAPONRANGE = "Range" -- Range name
function CWeaponRange:new(_argt)
    CWeaponRange.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONRANGE
    self.name = Classic.NAMEDWEAPONRANGE
    self.sprite  = CSpriteFG.WEAPONRANGE
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 4, handley = 3},
        [CSprite.ROTATE090] = {handlex = 4, handley = 4},
        [CSprite.ROTATE180] = {handlex = 3, handley = 4},
        [CSprite.ROTATE270] = {handlex = 3, handley = 3},
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
Classic.KINDDWEAPONBOWSMALL = "Bow.S" -- BowSmall kind
Classic.NAMEDWEAPONBOWSMALL = "Bow.S" -- BowSmall name
function CWeaponBowSmall:new(_argt)
    CWeaponBowSmall.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWSMALL
    self.name = Classic.NAMEDWEAPONBOWSMALL
    self.sprite  = CSpriteFG.WEAPONRBOWS
    self:argt(_argt) -- override if any
end

CWeaponBowMedium = CWeaponRange:extend() -- BowMedium weapons
Classic.KINDDWEAPONBOWMEDIUM = "Bow.M" -- BowMedium kind
Classic.NAMEDWEAPONBOWMEDIUM = "Bow.M" -- BowMedium name
function CWeaponBowMedium:new(_argt)
    CWeaponBowMedium.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWMEDIUM
    self.name = Classic.NAMEDWEAPONBOWMEDIUM
    self.sprite  = CSpriteFG.WEAPONRBOWM
    self:argt(_argt) -- override if any
end

CWeaponBowLarge = CWeaponRange:extend() -- BowLarge weapons
Classic.KINDDWEAPONBOWLARGE = "Bow.L" -- BowLarge kind
Classic.NAMEDWEAPONBOWLARGE = "Bow.L" -- BowLarge name
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
Classic.KINDDWEAPONBOOK = "Book" -- Book kind
Classic.NAMEDWEAPONBOOK = "Book" -- Book name
function CWeaponBook:new(_argt)
    CWeaponBook.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOOK
    self.name = Classic.NAMEDWEAPONBOOK
    self.sprite  = CSpriteFG.WEAPONBOOKB
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 6, handley = 2},
        [CSprite.ROTATE090] = {handlex = 5, handley = 6},
        [CSprite.ROTATE180] = {handlex = 1, handley = 5},
        [CSprite.ROTATE270] = {handlex = 2, handley = 1},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONFG,
        [CObject.INSIDE] = CObject.COLORIRONBG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
        [CObject.EXTRA1] = CObject.COLORIRONFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORONYXBG,
        [CObject.EFFECT] = CObject.COLORONYXFG,
        [CObject.EXTRA1] = CObject.COLORIRONFG,
    }
    self:argt(_argt) -- override if any
    self:implementnew(IObjectHandDefense)
end

CWeaponBookSmall = CWeaponBook:extend() -- BookSmall weapons
Classic.KINDWEAPONBOOKSMALL = "Book.S" -- BookSmall kind
Classic.NAMEWEAPONBOOKSMALL = "Book.S" -- BookSmall name
function CWeaponBookSmall:new(_argt)
    CWeaponBookSmall.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONBOOKSMALL
    self.name = Classic.KINDWEAPONBOOKSMALL
    self.sprite = CSpriteFG.WEAPONBOOKS
    self:argt(_argt) -- override if any
end

CWeaponBookMedium = CWeaponBook:extend() -- BookMedium weapons
Classic.KINDWEAPONBOOKMEDIUM= "Book.M" -- BookMedium kind
Classic.NAMEWEAPONBOOKMEDIUM= "Book.M" -- BookMedium name
function CWeaponBookMedium:new(_argt)
    CWeaponBookMedium.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONBOOKMEDIUM
    self.name = Classic.NAMEWEAPONBOOKMEDIUM
    self.sprite = CSpriteFG.WEAPONBOOKM
    self:argt(_argt) -- override if any
end

CWeaponBookLarge = CWeaponBook:extend() -- BookLarge weapons
Classic.KINDWEAPONBOOKLARGE= "Book.L" -- BookLarge kind
Classic.NAMEWEAPONBOOKLARGE= "Book.L" -- BookLarge name
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
Classic.KINDCLOTHESHAT = "Hat" -- ClothesHat kind
Classic.NAMECLOTHESHAT = "Hat" -- ClothesHat name
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
Classic.KINDCLOTHESHATSMALL = "Hat.S" -- ClothesHatSmall kind
Classic.NAMECLOTHESHATSMALL = "Hat.S" -- ClothesHatSmall name
function CClothesHatSmall:new(_argt)
    CClothesHatSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATSMALL
    self.name = Classic.NAMECLOTHESHATSMALL
    self.sprite = CSpriteFG.CLOTHESHATS
    self:argt(_argt) -- override if any
end

CClothesHatMedium = CClothesHat:extend() -- HatMedium objects
Classic.KINDCLOTHESHATMEDIUM = "Hat.M" -- ClothesHatMedium kind
Classic.NAMECLOTHESHATMEDIUM = "Hat.M" -- ClothesHatMedium name
function CClothesHatMedium:new(_argt)
    CClothesHatMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATMEDIUM
    self.name = Classic.NAMECLOTHESHATMEDIUM
    self.sprite = CSpriteFG.CLOTHESHATM
    self:argt(_argt) -- override if any
end

CClothesHatLarge = CClothesHat:extend() -- HatLarge objects
Classic.KINDCLOTHESHATLARGE = "Hat.L" -- ClothesHatLarge kind
Classic.NAMECLOTHESHATLARGE = "Hat.L" -- ClothesHatLarge name
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
Classic.KINDCLOTHESTOOLBOX = "Box" -- ClothesToolBox kind
Classic.NAMECLOTHESTOOLBOX = "Box" -- ClothesToolBox name
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
Classic.KINDCLOTHESTOOLBOXSMALL = "Box.S" -- ClothesToolBoxSmall kind
Classic.NAMECLOTHESTOOLBOXSMALL = "Box.S" -- ClothesToolBoxSmall name
function CClothesToolBoxSmall:new(_argt)
    CClothesToolBoxSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESTOOLBOXSMALL
    self.name = Classic.NAMECLOTHESTOOLBOXSMALL
    self.sprite    = CSpriteFG.CLOTHESTBXS
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesToolBoxMedium = CClothesToolBox:extend() -- ToolBoxMedium objects
Classic.KINDCLOTHESTOOLBOXMEDIUM = "Box.M" -- ClothesToolBoxMedium kind
Classic.NAMECLOTHESTOOLBOXMEDIUM = "Box.M" -- ClothesToolBoxMedium name
function CClothesToolBoxMedium:new(_argt)
    CClothesToolBoxMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESTOOLBOXMEDIUM
    self.name = Classic.NAMECLOTHESTOOLBOXMEDIUM
    self.sprite    = CSpriteFG.CLOTHESTBXM
    self.inventory = CInventoryAny4{}
    self:argt(_argt) -- override if any
end

CClothesToolBoxLarge = CClothesToolBox:extend() -- ToolBoxLarge objects
Classic.KINDCLOTHESTOOLBOXLARGE = "Box.L" -- ClothesToolBoxLarge kind
Classic.NAMECLOTHESTOOLBOXLARGE = "Box.L" -- ClothesToolBoxLarge name
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
Classic.KINDDOBJECTFLASK = "Flask" -- Flask kind
Classic.NAMEDOBJECTFLASK = "Flask" -- Flask name
function CObjectFlask:new(_argt)
    CObjectFlask.super.new(self, _argt)
    self.kind = Classic.KINDDOBJECTFLASK
    self.name = Classic.NAMEDOBJECTFLASK
    self.sprite  = CSpriteFG.OBJECTFLASB
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 3, handley = 1},
        [CSprite.ROTATE090] = {handlex = 6, handley = 3},
        [CSprite.ROTATE180] = {handlex = 4, handley = 6},
        [CSprite.ROTATE270] = {handlex = 1, handley = 4},
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
end

function CObjectFlask:draw()
    self:save()
    if self.used == CObject.USEDHALF then
        self.palettefg[CObject.EFFECT] = Tic.COLORKEY
        self.palettebg[CObject.EFFECT] = Tic.COLORKEY
    elseif self.used == CObject.USEDFULL then
        self.palettefg[CObject.EFFECT] = Tic.COLORKEY
        self.palettebg[CObject.EFFECT] = Tic.COLORKEY
        self.palettefg[CObject.INSIDE] = Tic.COLORKEY
        self.palettebg[CObject.INSIDE] = Tic.COLORKEY
    end
    CObjectFlask.super.draw(self)
    self:load()
end

CObjectFlaskSmall = CObjectFlask:extend() -- FlaskSmall objects
Classic.KINDOBJECTFLASKSMALL = "Oil.S" -- FlaskSmall kind
Classic.NAMEOBJECTFLASKSMALL = "Oil.S" -- FlaskSmall name
function CObjectFlaskSmall:new(_argt)
    CObjectFlaskSmall.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKSMALL
    self.name = Classic.NAMEOBJECTFLASKSMALL
    self.sprite  = CSpriteFG.OBJECTFLASS
    self:argt(_argt) -- override if any
end

CObjectFlaskMedium = CObjectFlask:extend() -- FlaskMedium objects
Classic.KINDOBJECTFLASKMEDIUM = "Oil.M" -- FlaskMedium kind
Classic.NAMEOBJECTFLASKMEDIUM = "Oil.M" -- FlaskMedium name
function CObjectFlaskMedium:new(_argt)
    CObjectFlaskMedium.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKMEDIUM
    self.name = Classic.NAMEOBJECTFLASKMEDIUM
    self.sprite  = CSpriteFG.OBJECTFLASM
    self:argt(_argt) -- override if any
end

CObjectFlaskLarge = CObjectFlask:extend() -- FlaskLarge objects
Classic.KINDOBJECTFLASKLARGE = "Oil.L" -- FlaskLarge kind
Classic.NAMEOBJECTFLASKLARGE = "Oil.L" -- FlaskLarge name
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
Classic.KINDDWEAPONMAGIC = "Magic" -- Magic kind
Classic.NAMEDWEAPONMAGIC = "Magic" -- Magic name
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
Classic.KINDDWEAPONWANDSMALL = "Wand.S" -- WandSmall kind
Classic.NAMEDWEAPONWANDSMALL = "Wand.S" -- WandSmall name
function CWeaponWandSmall:new(_argt)
    CWeaponWandSmall.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONWANDSMALL
    self.name = Classic.NAMEDWEAPONWANDSMALL
    self.sprite  = CSpriteFG.WEAPONMWNDS
    self:argt(_argt) -- override if any
end

CWeaponWandMedium = CWeaponMagic:extend() -- WandMedium weapons
Classic.KINDDWEAPONWANDMEDIUM = "Wand.M" -- WandMedium kind
Classic.NAMEDWEAPONWANDMEDIUM = "Wand.M" -- WandMedium name
function CWeaponWandMedium:new(_argt)
    CWeaponWandMedium.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONWANDMEDIUM
    self.name = Classic.NAMEDWEAPONWANDMEDIUM
    self.sprite  = CSpriteFG.WEAPONMWNDM
    self:argt(_argt) -- override if any
end

CWeaponWandLarge = CWeaponMagic:extend() -- WandLarge weapons
Classic.KINDDWEAPONWANDLARGE = "Wand.L" -- WandLarge kind
Classic.NAMEDWEAPONWANDLARGE = "Wand.L" -- WandLarge name
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
Classic.KINDDWEAPONRUNE = "Rune" -- Rune kind
Classic.NAMEDWEAPONRUNE = "Rune" -- Rune name
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
Classic.KINDWEAPONRUNESMALL = "Rune.S" -- RuneSmall kind
Classic.NAMEWEAPONRUNESMALL = "Rune.S" -- RuneSmall name
function CWeaponRuneSmall:new(_argt)
    CWeaponRuneSmall.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONRUNESMALL
    self.name = Classic.KINDWEAPONRUNESMALL
    self.sprite = CSpriteFG.WEAPONRUNES
    self:argt(_argt) -- override if any
end

CWeaponRuneMedium = CWeaponRune:extend() -- RuneMedium weapons
Classic.KINDWEAPONRUNEMEDIUM= "Rune.M" -- RuneMedium kind
Classic.NAMEWEAPONRUNEMEDIUM= "Rune.M" -- RuneMedium name
function CWeaponRuneMedium:new(_argt)
    CWeaponRuneMedium.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONRUNEMEDIUM
    self.name = Classic.NAMEWEAPONRUNEMEDIUM
    self.sprite = CSpriteFG.WEAPONRUNEM
    self:argt(_argt) -- override if any
end

CWeaponRuneLarge = CWeaponRune:extend() -- RuneLarge weapons
Classic.KINDWEAPONRUNELARGE= "Rune.L" -- RuneLarge kind
Classic.NAMEWEAPONRUNELARGE= "Rune.L" -- RuneLarge name
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
Classic.KINDCLOTHESCAP = "Cap" -- ClothesCap kind
Classic.NAMECLOTHESCAP = "Cap" -- ClothesCap name
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
Classic.KINDCLOTHESCAPSMALL = "Cap.S" -- ClothesCapSmall kind
Classic.NAMECLOTHESCAPSMALL = "Cap.S" -- ClothesCapSmall name
function CClothesCapSmall:new(_argt)
    CClothesCapSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESCAPSMALL
    self.name = Classic.NAMECLOTHESCAPSMALL
    self.sprite = CSpriteFG.CLOTHESCAPS
    self:argt(_argt) -- override if any
end

CClothesCapMedium = CClothesCap:extend() -- CapMedium objects
Classic.KINDCLOTHESCAPMEDIUM = "Cap.M" -- ClothesCapMedium kind
Classic.NAMECLOTHESCAPMEDIUM = "Cap.M" -- ClothesCapMedium name
function CClothesCapMedium:new(_argt)
    CClothesCapMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESCAPMEDIUM
    self.name = Classic.NAMECLOTHESCAPMEDIUM
    self.sprite = CSpriteFG.CLOTHESCAPM
    self:argt(_argt) -- override if any
end

CClothesCapLarge = CClothesCap:extend() -- CapLarge objects
Classic.KINDCLOTHESCAPLARGE = "Cap.L" -- ClothesCapLarge kind
Classic.NAMECLOTHESCAPLARGE = "Cap.L" -- ClothesCapLarge name
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
Classic.KINDCLOTHESSCROLLCASE = "Case" -- ClothesScrollCase kind
Classic.NAMECLOTHESSCROLLCASE = "Case" -- ClothesScrollCase name
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
Classic.KINDCLOTHESSCROLLCASESMALL = "Case.S" -- ClothesScrollCaseSmall kind
Classic.NAMECLOTHESSCROLLCASESMALL = "Case.S" -- ClothesScrollCaseSmall name
function CClothesScrollCaseSmall:new(_argt)
    CClothesScrollCaseSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESSCROLLCASESMALL
    self.name = Classic.NAMECLOTHESSCROLLCASESMALL
    self.sprite    = CSpriteFG.CLOTHESCASS
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesScrollCaseMedium = CClothesScrollCase:extend() -- ScrollCaseMedium objects
Classic.KINDCLOTHESSCROLLCASEMEDIUM = "Case.M" -- ClothesScrollCaseMedium kind
Classic.NAMECLOTHESSCROLLCASEMEDIUM = "Case.M" -- ClothesScrollCaseMedium name
function CClothesScrollCaseMedium:new(_argt)
    CClothesScrollCaseMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESSCROLLCASEMEDIUM
    self.name = Classic.NAMECLOTHESSCROLLCASEMEDIUM
    self.sprite    = CSpriteFG.CLOTHESCASM
    self.inventory = CInventoryAny4{}
    self:argt(_argt) -- override if any
end

CClothesScrollCaseLarge = CClothesScrollCase:extend() -- ScrollCaseLarge objects
Classic.KINDCLOTHESSCROLLCASELARGE = "Case.L" -- ClothesScrollCaseLarge kind
Classic.NAMECLOTHESSCROLLCASELARGE = "Case.L" -- ClothesScrollCaseLarge name
function CClothesScrollCaseLarge:new(_argt)
    CClothesScrollCaseLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESSCROLLCASELARGE
    self.name = Classic.NAMECLOTHESSCROLLCASELARGE
    self.sprite    = CSpriteFG.CLOTHESCASL
    self.inventory = CInventoryAny6{}
    self:argt(_argt) -- override if any
end
