#!/usr/bin/env lua

local foo = {'on', 'two', 'three'}

print(#foo)

for k,v in ipairs(foo) do
    print(v)
end


 -- vim: syntax=lua ts=2 sw=2
