--
-- CScreen
--
CScreen = CElement:extend() -- generic screen -- HAS TO BE AFTER WINDOWS AND BUTTONS
Classic.KINDSCREEN = "Screen" -- Screen kind
Classic.NAMESCREEN = "Screen" -- Screen name
function CScreen:new(_argt)
    CScreen.super.new(self, _argt)
    self.kind = Classic.KINDSCREEN
    self.name = Classic.NAMESCREEN
    self.windows       = {} -- screen windows if any -- ordered
    self.buttons       = {} -- screen buttons if any -- ordered
    self.screens       = {} -- sub screens (layers) if any -- ordered
    self.display       = true -- display this screen ?
    self.keysfunctions = nil -- keys to functions mapping if any
    self:argt(_argt) -- override if any
end

function CScreen:draw()
    if not self.display then return end -- nothing to display
    Tic:screenKeyboard(self) -- adjust keyboard mapping
    Tic:screenButtons(self)  -- adjust buttons mapping
    self:drawWindows()
    self:drawButtons()
    for _, _screen in ipairs(self.screens or {}) do -- layer ordered
        _screen:draw()
    end
end

function CScreen:drawWindows() -- draw ordered
    for _, _window in ipairs(self.windows or {}) do
        _window:draw()
    end
end

function CScreen:drawButtons() -- draw ordered
    local _buttonhovered = nil
    for _, _button in ipairs(self.buttons or {}) do
        _button:draw()
        if _button.hovered then _buttonhovered = _button end -- record hovered button
    end
    if _buttonhovered then _buttonhovered:draw() end -- redraw hovered button in front (for hovertext) if any
end

function CScreen:appendWindow(_window) -- append window -- unique
    if not _window then return end -- mandarory
    if not _window:is(CWindow) then return end -- only windows
    Tables:valInsert(self.windows, _window, true)
end

function CScreen:appendButton(_button) -- append button -- unique
    if not _button then return end -- mandarory
    if not _button:is(CButton) then return end -- only buttons
    Tables:valInsert(self.buttons, _button, true)
end

function CScreen:appendScreen(_screen) -- append screen -- unique
    if not _screen then return end -- mandarory
    if not _screen:is(CScreen) then return end -- only screens
    Tables:valInsert(self.screens, _screen, true)
end

function CScreen:appendElement(_element) -- append element -- unique
    if not _element then return end -- mandarory
    CScreen.super.appendElement(self, _element)
    self:appendWindow(_element) -- try all kinds
    self:appendButton(_element)
    self:appendScreen(_element)
end

function CScreen:elementsTotalW(_elements, _separator) -- total w of elements with optional separator
    _separator = _separator or 0
    local _result = 0
    for _, _element in ipairs(_elements or {}) do
        _result = _result + _element.screenw + _separator
    end
    _result = (_result == 0) and _result or _result - _separator -- skip last separator
    return _result
end

function CScreen:elementsTotalH(_elements, _separator) -- total h of elements with optional separator
    _separator = _separator or 0
    local _result = 0
    for _, _element in ipairs(_elements or {}) do
        _result = _result + _element.screenh + _separator
    end
    _result = (_result == 0) and _result or _result - _separator -- skip last separator
    return _result
end

function CScreen:elementsDistributeH(_elements, _screenx, _screeny, _separator) -- distribute h elements with optional separator and xy
    _separator = _separator or 0
    for _, _element in ipairs(_elements or {}) do
        if _screenx then
            if _screenx >= 0 then -- gt 0 force x
                _element.screenx = _screenx
            else -- lt 0 keep its own x -- not useful here
            end
        else -- nil ajust x to the first element
            _screenx = _element.screenx
        end
        if _screeny then
            if _screeny >= 0 then -- gt 0 force y
                _element.screeny = _screeny
            else -- lt 0 keep its own y
            end
        else -- nil ajust y to the first element
            _screeny = _element.screeny
        end
        _screenx = _screenx + _element.screenw + _separator
    end
end

function CScreen:elementsDistributeV(_elements, _screenx, _screeny, _separator) -- distribute v elements with optional separator and xy
    _separator = _separator or 0
    for _, _element in ipairs(_elements or {}) do
        if _screenx then
            if _screenx >= 0 then -- gt 0 force x
                _element.screenx = _screenx
            else -- lt 0 keep its own x
            end
        else -- nil ajust x to the first element
            _screenx = _element.screenx
        end
        if _screeny then
            if _screeny >= 0 then -- gt 0 force y
                _element.screeny = _screeny
            else -- lt 0 keep its own y -- not useful here
            end
        else -- nil ajust y to the first element
            _screeny = _element.screeny
        end
        _screeny = _screeny + _element.screenh + _separator
    end
end
