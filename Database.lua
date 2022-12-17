--[[

	The MIT License (MIT)

	Copyright (c) 2022 Lucas Vienna (Avyiel) <dev@lucasvienna.dev>
	Copyright (c) 2022 Snowshock <http://github.com/Kazan/>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

--]]
-- Retrive addon folder name, and our local, private namespace.
local _, addon = ...

-- Database
-----------------------------------------------------------
addon.db = {
	elementals = {
		name = "Move |cffcc1a1aElementals|r",
		desc = "Move |cffcc1a1aElementals|r into their own category",
		category = "|cffcc1a1aElementals|r",
		items = {
			190327, -- Awakened Air
			190331, -- Awakened Decay
			190316, -- Awakened Earth
			190321, -- Awakened Fire
			190329, -- Awakened Frost
			190324, -- Awakened Order
			190326, -- Rousing Air
			190330, -- Rousing Decay
			190315, -- Rousing Earth
			190320, -- Rousing Fire
			190328, -- Rousing Frost
			190322, -- Rousing Order
		},
	},
}
