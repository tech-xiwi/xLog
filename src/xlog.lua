--[==[

xiwi module for Lua 5.3

Version 1.0

You can contact the author by sending an e-mail to 'xiwi' at the
email 'xiwi92@hotmail.com'.


Copyright (C) 2017-2020 xiwi

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]==]

local xlog = {_version="1.0"}

DEBUG = true

local function traceback()
    local stack = 1
    local infoResult
    local name
    for level = 1, math.huge do
        local info = debug.getinfo(level, "nSl")
        if not info then break end
        if info.what == "C" then
        else
            if info.name then
                name = info.name
            end
            stack = level
            infoResult = info
        end
    end
    return stack,infoResult,name
end

function xlog.openDebug(open)
    DEBUG = open
end

function xlog.d(tag, msg)
    if DEBUG then
        print(log("d", tag, msg))
    end
end

function xlog.i(tag, msg)
    if DEBUG then
        print(log("i", tag, msg))
    end
end

function xlog.e(tag, msg)
    print(log("e", tag, msg))
end

function xlog.w(tag, msg)
    if DEBUG then
        print(log("w", tag, msg))
    end
end

function xlog.v(tag, msg)
    if DEBUG then
        print(log("v", tag, msg))
    end
end

function log(level, tag, msg)
    local date = os.time()
    local millSec = string.format("%.6f", os.clock())
    date = os.date("%Y-%m-%d %H:%M:%S", date)
    if DEBUG then
        local line
        local stack, info ,name = traceback()
        if name == "d" or name == "i" or name == "e"  or name == "w"or name == "v" then
            line = info.currentline
        else
            line = debug.getinfo(stack-2).currentline
        end
        return date .. string.sub(millSec,2,#millSec) .. " xLog : [" .. level .. "] " .. info.source.. " : " .. tag .. " line=" .. line .. " : " .. name .. " : " .. msg
    else
        return date .. string.sub(millSec,2,#millSec) .. " xLog : [".. level .. "] : " .. tag .. " : " .. msg
    end
end

return xlog


