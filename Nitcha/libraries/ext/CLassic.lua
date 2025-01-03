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


function Classic:new()
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


-- function Classic:implement(...) -- implement only new functions -- original version
--   for _, _classic in pairs({...}) do
--     for _key, _val in pairs(_classic) do
--       if self[_key] == nil and type(_val) == "function" then
--         self[_key] = _val
--       end
--     end
--   end
-- end


function Classic:defaultArg(_arg, _default, ...) -- return _arg if _arg exists in allowed ... else return _default
  for _, _allowed in ipairs({...}) do
    if _arg == _allowed then return _arg end
  end
  return _default
end

function Classic:implement(_new, _type, ...) -- implement vars or fcts or both (depending of _type) if they exist or not (depending of _new)
  _new = Classic:defaultArg(_new, "all", "new", "all") -- new = only if not existing, all = even existing
  _type = Classic:defaultArg(_type, "all", "var", "fct", "all") -- only vars, fcts or all
  for _, _classic in ipairs({...}) do
    for _key, _val in pairs(_classic) do
      if self[_key] ~= nil and _new == "new" then break end
      if type(_val) == "function" and _type == "vars" then break end
      self[_key] = _val
    end
  end
end


function Classic:is(T)
  local mt = getmetatable(self)
  while mt do
    if mt == T then
      return true
    end
    mt = getmetatable(mt)
  end
  return false
end


function Classic:__tostring()
  return "Classic"
end


function Classic:__call(...)
  local obj = setmetatable({}, self)
  obj:new(...)
  return obj
end


-- END
return Classic
