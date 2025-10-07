--
-- ICharacterHumanoid
--
ICharacterHumanoid = Classic:extend{ -- humanoid characters implementation
    handlesoffsets = { -- hands, head and back offsets
        [Tic.STATUSIDLE] = {
            [Tic.DIRXLF] = {
                [CSprite.FRAME00] = {
                    handrgx = 2, handrgy = 6,
                    handlfx = 5, handlfy = 6,
                    headx = 4, heady = 2,
                    backx = 5, backy = 3,
                    state = Tic.STATEIDLELF
                },
                [CSprite.FRAME01] = {
                    handrgx = 2, handrgy = 6,
                    handlfx = 5, handlfy = 6,
                    headx = 4, heady = 2,
                    backx = 5, backy = 3,
                    state = Tic.STATEIDLELF
                },
            },
            [Tic.DIRXRG] = {
                [CSprite.FRAME00] = {
                    handrgx = 5, handrgy = 6,
                    handlfx = 2, handlfy = 6,
                    headx = 3, heady = 2,
                    backx = 2, backy = 3,
                    state = Tic.STATEIDLERG
                },
                [CSprite.FRAME01] = {
                    handrgx = 5, handrgy = 6,
                    handlfx = 2, handlfy = 6,
                    headx = 3, heady = 2,
                    backx = 2, backy = 3,
                    state = Tic.STATEIDLERG
                },
            },
        },
        [Tic.STATUSWORK] = {
            [Tic.DIRXLF] = {
                [CSprite.FRAME00] = {
                    handrgx = 1, handrgy = 7,
                    handlfx = 6, handlfy = 6,
                    headx = 4, heady = 2,
                    backx = 5, backy = 3,
                    state = Tic.STATEWORKLF
                },
                [CSprite.FRAME01] = {
                    handrgx = 1, handrgy = 7,
                    handlfx = 6, handlfy = 6,
                    headx = 4, heady = 2,
                    backx = 5, backy = 3,
                    state = Tic.STATEWORKLF
                },
            },
            [Tic.DIRXRG] = {
                [CSprite.FRAME00] = {
                    handrgx = 6, handrgy = 7,
                    handlfx = 1, handlfy = 6,
                    headx = 3, heady = 2,
                    backx = 2, backy = 3,
                    state = Tic.STATEWORKRG
                },
                [CSprite.FRAME01] = {
                    handrgx = 6, handrgy = 7,
                    handlfx = 1, handlfy = 6,
                    headx = 3, heady = 2,
                    backx = 2, backy = 3,
                    state = Tic.STATEWORKRG
                },
            },
        },
        [Tic.STATUSMOVE] = {
            [Tic.DIRXLF] = {
                [CSprite.FRAME00] = {
                    handrgx = 1, handrgy = 5,
                    handlfx = 6, handlfy = 6,
                    headx = 4, heady = 2,
                    backx = 5, backy = 3,
                    state = Tic.STATEMOVELF
                },
                [CSprite.FRAME01] = {
                    handrgx = 1, handrgy = 6,
                    handlfx = 6, handlfy = 5,
                    headx = 4, heady = 2,
                    backx = 5, backy = 3,
                    state = Tic.STATEMOVELF
                },
            },
            [Tic.DIRXRG] = {
                [CSprite.FRAME00] = {
                    handrgx = 6, handrgy = 5,
                    handlfx = 1, handlfy = 6,
                    headx = 3, heady = 2,
                    backx = 2, backy = 3,
                    state = Tic.STATEMOVERG
                },
                [CSprite.FRAME01] = {
                    handrgx = 6, handrgy = 6,
                    handlfx = 1, handlfy = 5,
                    headx = 3, heady = 2,
                    backx = 2, backy = 3,
                    state = Tic.STATEMOVERG
                },
            },
        },
        [Tic.POSTUREFLOOR] = {
            [Tic.DIRXLF] = {
                [Tic.SIZES] = {
                    handrgx =  1, handrgy = 3,
                    handlfx =  1, handlfy = 8,
                    headx = 5, heady = 6,
                    backx = 9, backy = 5,
                    state = Tic.STATEFLOORLF
                },
                [Tic.SIZEM] = {
                    handrgx =  0, handrgy = 3,
                    handlfx =  0, handlfy = 8,
                    headx = 5, heady = 6,
                    backx = 9, backy = 5,
                    state = Tic.STATEFLOORLF
                },
                [Tic.SIZEL] = {
                    handrgx = -1, handrgy = 3,
                    handlfx = -1, handlfy = 8,
                    headx = 5, heady = 6,
                    backx = 9, backy = 5,
                    state = Tic.STATEFLOORLF
                },
            },
            [Tic.DIRXRG] = {
                [Tic.SIZES] = {
                    handrgx = 6, handrgy = 8,
                    handlfx = 6, handlfy = 3,
                    headx = 2, heady = 6,
                    backx = -2, backy = 5,
                    state = Tic.STATEFLOORRG
                },
                [Tic.SIZEM] = {
                    handrgx = 7, handrgy = 8,
                    handlfx = 7, handlfy = 3,
                    headx = 2, heady = 6,
                    backx = -2, backy = 5,
                    state = Tic.STATEFLOORRG
                },
                [Tic.SIZEL] = {
                    handrgx = 8, handrgy = 8,
                    handlfx = 8, handlfy = 3,
                    headx = 2, heady = 6,
                    backx = -2, backy = 5,
                    state = Tic.STATEFLOORRG
                },
            },
        },
    }
}

function ICharacterHumanoid:drawBody()
    local _posture         = self:postureGet()
    local _status          = self:statusGet()
    local _posturesettings = Tic.POSTURESETTINGS[_posture]
    local _statussettings  = Tic.STATUSSETTINGS[_status]

    local _bodyspriteoffset = _posturesettings.bodyspriteoffset + _statussettings.bodyspriteoffset
    local _bodyoffsetx      = _posturesettings.bodyoffsetx
    _bodyoffsetx = (_bodyoffsetx == nil and self.dirx == Tic.DIRXLF)
        and Nums:pos(self.size) -- nil use size
        or  _bodyoffsetx
    _bodyoffsetx = (_bodyoffsetx == nil and self.dirx == Tic.DIRXRG)
        and Nums:neg(self.size) -- nil use size
        or  _bodyoffsetx
    local _bodyoffsety      = _posturesettings.bodyoffsety
    local _bodyrotate       = _posturesettings.rotate
    local _bodyframe        = _posturesettings.frame
    _bodyframe = (_bodyframe)
        and _bodyframe -- fix frame
        or  self.frame

    local _musprite = CSpriteFG() -- multi usage sprite
    _musprite.sprite  = self.bodysprite + _bodyspriteoffset -- apply the corresponding attributes
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.offsetx = _bodyoffsetx
    _musprite.offsety = _bodyoffsety
    _musprite.rotate  = _bodyrotate
    _musprite.frame   = _bodyframe
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx
    _musprite.palette = { -- apply body palette
        [Tic.COLORARMOR] = self.colorarmor,
        [Tic.COLORSHIRT] = self.colorshirt,
        [Tic.COLORPANTS] = self.colorpants,
        [Tic.COLORHANDS] = self.colorhands,
    }
    _musprite:draw()
end

function ICharacterHumanoid:drawHead()
    local _posture         = self:postureGet()
    local _posturesettings = Tic.POSTURESETTINGS[_posture]

    local _headoffsetx     = _posturesettings.headoffsetx
    local _headoffsety     = _posturesettings.headoffsety
    _headoffsety           = (_posturesettings.headusesize)
        and _headoffsety + self.size
        or  _headoffsety
    local _headrotate      = _posturesettings.rotate


    local _musprite = CSpriteFG() -- multi usage sprite

    -- draw head
    _musprite.sprite  = self.headsprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.offsetx = _headoffsetx
    _musprite.offsety = _headoffsety
    _musprite.rotate  = _headrotate
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx
    _musprite.palette = { -- apply head palette
        [Tic.COLORHAIRSFG] = self.colorhairsfg,
        [Tic.COLORHAIRSBG] = self.colorhairsbg,
        [Tic.COLOREXTRA]   = self.colorextra,
        [Tic.COLORSKIN]    = self.colorskin,
    }
    _musprite:draw()

    -- draw head eyes
    local _coloreyesfg = Tic.COLORKEY
    local _coloreyesbu = Tic.COLORKEY
    local _coloreyesbm = Tic.COLORKEY
    local _coloreyesbd = Tic.COLORKEY

    if _posture == Tic.POSTUREFLOOR then
        _coloreyesbm = self.coloreyesbg
    else
        _coloreyesfg = self.coloreyesfg
        if self.diry == Tic.DIRYUP then -- up
            _coloreyesbu = self.coloreyesbg
        elseif self.diry == Tic.DIRYMD then -- md
            _coloreyesbm = self.coloreyesbg
        else -- dw
            _coloreyesbd = self.coloreyesbg
        end
    end

    _musprite.sprite  = self.eyessprite -- apply the corresponding attributes
    _musprite.palette = { -- apply eyes palette
        [Tic.COLOREYESFG] = _coloreyesfg,
        [Tic.COLOREYESBU] = _coloreyesbu,
        [Tic.COLOREYESBM] = _coloreyesbm,
        [Tic.COLOREYESBD] = _coloreyesbd,
    }
    _musprite:drawDirectives()

    -- draw head slot if any
    if not self.slots then return end -- mandatory
    local _handlesoffsets = self:handlesOffsets() -- determine the corresponding head offsets
    local _headx  = _handlesoffsets.headx
    local _heady  = _handlesoffsets.heady
    self:drawHandle(_headx, _heady, Tic.COLORORANGE)

    local _object = self:slotGetHeadObject()
    if not _object then return end

    local _handleoffsets = _object:handleOffsets(_handlesoffsets.state) -- determine the object handle offsets
    local _objecthandlex = _handleoffsets.handlex
    local _objecthandley = _handleoffsets.handley
    local _objectrotate  = _handleoffsets.rotate
    local _objectflip    = _handleoffsets.flip

    local _headx   = _headx - _objecthandlex -- adjust handles
    local _heady   = _heady - _objecthandley

    _object:save()
    _object.screenx  = self.screenx
    _object.screeny  = self.screeny
    _object.offsetx  = _headx
    _object.offsety  = _heady
    _object.scale    = self.scale
    _object.rotate   = _objectrotate
    _object.dirx     = _objectflip
    _object:draw()
    _object:load()
end
