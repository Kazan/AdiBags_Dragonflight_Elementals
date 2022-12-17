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
local L = addon.L
local DB = addon.db

-- Lua API
-----------------------------------------------------------
local ipairs = ipairs

-- Callbacks
-----------------------------------------------------------
local function enableIds(dict, id_list)
	for _, v in ipairs(id_list.items) do
		dict[v] = L[id_list.category]
	end
end

-- Private Addon APIs and Tables
-----------------------------------------------------------
local Cache

-- AdiBags namespace
-----------------------------------------------------------
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

-- Filter Registration
-----------------------------------------------------------
local filter = AdiBags:RegisterFilter("Dragonflight Elementals", 92, "ABEvent-1.0")
filter.uiName = L["|cffa0a0a0Dragonflight Elementals|r"]
filter.uiDesc = L["Put common Dragoflight Elementals in their own categories."]

function filter:OnInitialize()
	-- Register the settings namespace
	self.db = AdiBags.db:RegisterNamespace(self.filterName, {
		profile = {
			-- Add your settings here
			move_elementals = true,
		},
	})
	-- Populate our cache now that settings have loaded
	Cache = self:BuildCache()
end

function filter:Update()
	-- Update filtered IDs
	Cache = self:BuildCache()
	-- Notify myself that the filtering options have changed
	self:SendMessage("AdiBags_FiltersChanged")
end

function filter:OnEnable()
	AdiBags:UpdateFilters()
end

function filter:OnDisable()
	AdiBags:UpdateFilters()
end

-- Main Filter
-----------------------------------------------------------
function filter:Filter(slotData)
	local itemId = slotData.itemId

	if (itemId and Cache[itemId]) then
		return Cache[itemId], L["Dragonflight Elementals"]
	end
end

function filter:BuildCache()
	local ids = {}

	if self.db.profile.move_elementals then
		enableIds(ids, DB.elementals)
	end

	return ids
end

-- Filter Options Panel
-----------------------------------------------------------
function filter:GetOptions()
	return {
		-- Setup for the options panel
		move_elementals = {
			name = L[DB.elementals.name],
			desc = L[DB.elementals.desc],
			type = "toggle",
			order = 999,
		},
	}, AdiBags:GetOptionHandler(self, true, function() return self:Update() end)
end
