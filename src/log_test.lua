local log = require("xlog")
local socket = require "socket"
local t0 = socket.gettime()

tag = "tag"
-- log.openDebug(false)

for i=1,100000 do
    if i % 5 == 0 then
        log.i(tag,"log content "..i)
    elseif i % 5 == 1 then
        log.v(tag,"log content "..i)
    elseif i % 5 == 2 then
        log.d(tag,"log content "..i)
    elseif i % 5 == 3 then
        log.w(tag,"log content "..i)
    elseif i % 5 == 4 then
        log.e(tag,"log content "..i)
    end
end

local t1 = socket.gettime()
print("used time: "..t1-t0.."s")