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

Classic.NIL = "~~NiL~~" --used to remove fields


function Classic:new(...)
  self._savestack = {} -- for saving/loading fields -- {{k = v, ...}, ...}
  self.kind = "Classic"
  self.name = "Classic"
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


function Classic:implement(...) -- implement (only) new functions -- original version
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
  local _mt = getmetatable(self) -- temporary disable metatable
  setmetatable(self, nil)
  local _address = tostring(self)
  _address = string.sub(_address, string.find(_address, " ") + 1)
  setmetatable(self, _mt)
  return self.kind..": ".._address
end


function Classic:__call(...)
  local obj = setmetatable({}, self)
  obj:new(...)
  return obj
end


--
-- LKS additions
--
function Classic:implementnew(...) -- implement new functions and variables -- modified version
  for _, _classic in pairs({...}) do
    for _key, _val in pairs(_classic) do
      if  not (_key:find("__") == 1) and not (_key == "super") and self[_key] == nil then
        self[_key] = _val
      end
    end
  end
end


function Classic:implementall(...) -- implement all functions and variables -- modified version
  for _, _classic in pairs({...}) do
    for _key, _val in pairs(_classic) do
      if not (_key:find("__") == 1) and not (_key == "super") then
        self[_key] = _val
      end
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


function Classic:argt(_argt) -- set a classic tables key/val from a _argt table {k = v, ...}
  for _key, _val in pairs(_argt or {}) do
    local _subkeys = {}
    for _subkey in string.gmatch(_key, "[^%.]+") do
        table.insert(_subkeys, _subkey)
    end

    local _ptrkey = self
    local _subkey = _subkeys[1]

    for _idxkey = 1, #_subkeys - 1 do
      _subkey = _subkeys[_idxkey]
      if not _ptrkey[_subkey] then _ptrkey[_subkey] = {} end
      if type(_ptrkey[_subkey]) == "table" then
        _ptrkey = _ptrkey[_subkey]
        _subkey = _subkeys[_idxkey + 1]
      end
    end

    if _val == Classic.NIL then
      _ptrkey[_subkey] = nil -- remove a key
    else
      _ptrkey[_subkey] = _val
    end
  end
end


function Classic:save(_keys) -- save (into stack) a table of argt from a list of keys {"k", ...}
  if not _keys or #_keys == 0 then -- all keys by default
    _keys = {}
    for _key, _ in pairs(self) do
      table.insert(_keys, _key)
    end
  end
  local _argt = {}
  for _, _key in pairs(_keys) do
    _argt[_key] = self[_key]
  end
  table.insert(self._savestack, _argt)
end


function Classic:load() -- load (from stack) a table of argt {k = v, ...}
  local _argt = table.remove(self._savestack)
  self:argt(_argt)
end


function Classic:string() -- classic as a string
  return self.kind.." "..self.name
end


-- END
return Classic
