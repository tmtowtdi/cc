#!/usr/bin/env lua

var = true

for i = 1,5 do
    print(i)
    if var then
        print("in if")
        break
    end
end

