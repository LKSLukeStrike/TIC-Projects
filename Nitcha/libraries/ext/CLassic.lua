-- Originaly from the classic module
-- https://github.com/rxi/classic/tree/master
-- Copyright (c) 2014, rxi
-- This module is free software; you can redistribute it and/or modify it under
-- the terms of the MIT license. See LICENSE for details.
--
-- LKS
-- Renamed Classic
-- Include it with Classic = require("Classic")


local Classic = {}
Classic.__index = Classic


function Classic:new(...)
  self._savestack = {} -- for saving/loading fields -- {{k = v, ...}, ...}
end


function Classic:extend()
  local _classic = {}
  for _key, _val in pairs(self) do
    if _key:find("__") == 1 then
      _classic[_key] = _val
    end
  end
  _classic.__index = _classic
  _classic.super = self
  setmetatable(_classic, self)
  return _classic
end


function Classic:implement(...) -- implement only new functions -- original version
  for _, _classic in pairs({...}) do
    for _key, _val in pairs(_classic) do
      if self[_key] == nil and type(_val) == "function" then
        self[_key] = _val
      end
    end
  end
end


function Classic:is(_type)
  local _metatable = getmetatable(self)
  while _metatable do
    if _metatable == _type then
      return true
    end
    _metatable = getmetatable(_metatable)
  end
  return false
end


function Classic:__tostring()
  return self:_kind()..": "..string.format("%p", self)
end


function Classic:__call(...)
  local obj = setmetatable({}, self)
  obj:new(...)
  return obj
end


--
-- LKS additions
--
function Classic:_defaultArg(_arg, _default, ...) -- return _arg if _arg in allowed ... else _default
  for _, _allowed in pairs({...}) do
    if _arg == _allowed then return _arg end
  end
  return _default
end


-- TODO rewrite this ?
function Classic:implementIfType(_new, _type, ...) -- implement vars or fcts or both (depending of _type) if they exist or not (depending of _new)
  _new = Classic:_defaultArg(_new, "all", "new", "all") -- new = only if not existing, all = even existing
  _type = Classic:_defaultArg(_type, "all", "var", "fct", "all") -- only vars, fcts or all
  for _, _classic in pairs({...}) do
    for _key, _val in pairs(_classic) do
      if self[_key] ~= nil and _new == "new" then break end
      if type(_val) == "function" and _type == "vars" then break end
      self[_key] = _val
    end
  end
end


function Classic:_size() -- size (number of keys) of a classic table
  local _result = 0
  for _key, _val in pairs(self) do
    _result = _result + 1
  end
  return _result
end


function Classic:_keys() -- keys of a classic table -- SORTED
  local _result = {}
  for _key, _val in pairs(self) do
    table.insert(_result, _key)
  end
  table.sort(_result)
  return _result
end


function Classic:_vals() -- vals of a classic table -- SORTED
  local _result = {}
  local _selfkeys = self:_keys() -- sorted keys
  for _key, _val in pairs(_selfkeys) do -- _val is the key for self
    table.insert(_result, self[_val])
  end
  return _result
end


function Classic:_copy() -- copy of a classic table
  local _result = {}
  for _key, _val in pairs(self) do
    table.insert(_result, _key)
    _result[_key] = _val
  end
  return _result
end


function Classic:_argt(_argt) -- set a classic tables key/val from a _argt table {k = v, ...}
  for _key, _val in pairs(_argt or {}) do
    self[_key] = _val
  end
end


function Classic:_save(_keyt) -- save (into stack) a table of keys {"k", ...}
  local _argt = {}
  for _, _key in pairs(_keyt or {}) do
    _argt[_key] = self[_key]
  end
  table.insert(self._savestack, _argt)
end


function Classic:_load() -- load (from stack) a table of argt {k = v, ...}
  local _argt = table.remove(self._savestack)
  self:_argt(_argt)
end


function Classic:_kind() -- returns the kind of the classic if .kind exists else "Classic"
  return self.kind or "Classic"
end


-- END
return Classic
