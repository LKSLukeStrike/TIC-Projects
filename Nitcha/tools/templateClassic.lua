_classic  = arg[1]
if not _classic then return end
_cextend  = arg[2] and "C"..arg[2] or "Classic"
_comment  = arg[3] and arg[3] or "generic "..string.lower(_classic)
_cclassic = "C".._classic
_uclassic = string.upper(_classic)
_kclassic = "Classic.KIND".._uclassic
_nclassic = "Classic.NAME".._uclassic


_template = [[
--
-- _cclassic
--
_cclassic = _cextend:extend() -- _comment
_kclassic = "_classic"
_nclassic = "_classic"
function _cclassic:new(_argt)
    _cclassic.super.new(self, _argt)
    self.kind = _kclassic
    self.name = _nclassic
    self:argt(_argt) -- override if any
end
]]

_template = _template:gsub("_cclassic", _cclassic)
_template = _template:gsub("_cextend" , _cextend)
_template = _template:gsub("_comment" , _comment)
_template = _template:gsub("_kclassic", _kclassic)
_template = _template:gsub("_nclassic", _nclassic)
_template = _template:gsub("_classic" , _classic)

print()
print(_template)
