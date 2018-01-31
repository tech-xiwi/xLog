local log = require("xlog")
local socket = require "socket"
local t0 = socket.gettime()

tag = "log_test.lua"

for i=1,100 do
    -- log.v(tag,"test long content "..i)
    if i % 5 == 0 then
        log.i(tag,"test long content "..i)
    elseif i % 5 == 1 then
        log.v(tag,"test long content "..i)
    elseif i % 5 == 2 then
        log.d(tag,"test long content "..i)
    elseif i % 5 == 3 then
        log.w(tag,"test long content "..i)
    elseif i % 5 == 4 then
        log.e(tag,"test long content "..i)
    end
end

-- do something
local t1 = socket.gettime()
print("used time: "..t1-t0.."s")