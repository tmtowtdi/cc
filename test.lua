#!/usr/bin/env lua

local cooked = {
  name = 'jon',
  age = 47
}


function foo()
  local names = {}
  for k,v in pairs(cooked) do
    table.insert(names,k)
  end
  return names
end

local n = foo()
for i = 1,#n do print(n[i]) end


 -- vim: syntax=lua tw=39 ts=2 sw=2
