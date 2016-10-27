#!/usr/bin/env lua

local files = {
    ['bin/foo'] = '2DRzRAR3',
    --lib/settings      = 'nqQjpWVX',
}
for path, hash in pairs(files) do
    print(path..' '..hash)
end

