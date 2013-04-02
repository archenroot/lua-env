#!/usr/bin/env lua5.2
-- env - Lua library for getting, setting and clearing env variables
-- Copyright (C) 2013 Jens Oliver John <asterisk@2ion.de>
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Project home: https://github.com/2ion/lua-env

-- Env.lua
local setenv = require("env").setenv
local getenv = os.getenv
local Env = {}
setmetatable(Env, {
    __index = function (t, key)
        local v = getenv(tostring(key))
        if not v or #v == 0 then return nil end
        return v
    end,
    __newindex = function (t, key, value)
        setenv(key, value)
    end
})
return Env