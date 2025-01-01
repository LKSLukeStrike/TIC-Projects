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
  local cls = {}
  for k, v in pairs(self) do
    if k:find("__") == 1 then
      cls[k] = v
    end
  end
  cls.__index = cls
  cls.super = self
  setmetatable(cls, self)
  return cls
end


function Classic:implement(...)
  for _, cls in pairs({...}) do
    for k, v in pairs(cls) do
      if self[k] == nil and type(v) == "function" then
        self[k] = v
      end
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


return Classic