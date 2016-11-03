#!/usr/bin/env lua

function isnan(x) return x ~= x end

local n = 0/0
print(n)

print( isnan(5) )
print( isnan(n) )

 -- vim: syntax=lua ts=2 sw=2
