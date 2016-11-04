#!/usr/bin/env lua

--[[
  items = {
    item           = slots where it appears
    ---------------------------------------
    minecraft:dirt = {1, 3, 15},
    minecraft:coal = {2, 7, 13, 14}
  }
--]]


name = 'jon'
items = {}

for i=1,8,2 do
  if not items[name] then items[name] = {} end
  table.insert( items[name], i )
end

print( items[name][1] ..'-'..items[name][2] )

 -- vim: syntax=lua ts=2 sw=2
