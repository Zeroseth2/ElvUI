local E, L, V, P, G = unpack(ElvUI)

local type = type
local next = next
local unpack = unpack
local strsplit = strsplit

E.Filters = {
	List = function(priority)
		return {
			enable = true,
			priority = priority or 0,
			stackThreshold = 0
		}
	end,
	Aura = function(auraID, includeIDs, point, color, anyUnit, onlyShowMissing, displayText, textThreshold, xOffset, yOffset)
		local r, g, b = 1, 1, 1
		if color then r, g, b = unpack(color) end

		if type(includeIDs) == 'string' then
			includeIDs = { strsplit('[, ]', includeIDs) }
		end

		return {
			id = auraID,
			includeIDs = includeIDs,
			enabled = true,
			point = point or 'TOPLEFT',
			color = { r = r, g = g, b = b },
			anyUnit = anyUnit or false,
			onlyShowMissing = onlyShowMissing or false,
			displayText = displayText or false,
			textThreshold = textThreshold or -1,
			xOffset = xOffset or 0,
			yOffset = yOffset or 0,
			style = 'coloredIcon',
			sizeOffset = 0,
			stack = { anchor = 'BOTTOMRIGHT', xOffset = 1, yOffset = 1 }
		}
	end,
	Expand = function(output, source)
		output = output or {}

		for auraID, auraInfo in next, source do
			if auraInfo.includeIDs then
				for _, spellID in next, auraInfo.includeIDs do
					output[spellID] = source[auraID]
				end
			end
			output[auraID] = source[auraID]
		end

		return output
	end
}

-- Profile specific BuffIndicator
P.unitframe.filters = {
	aurawatch = {},
}

G.unitframe.aurafilters = {}

G.unitframe.specialFilters = {
	-- Whitelists
	Boss = true,
	MyPet = true,
	OtherPet = true,
	Personal = true,
	nonPersonal = true,
	CastByUnit = true,
	notCastByUnit = true,
	Dispellable = true,
	notDispellable = true,
	CastByNPC = true,
	CastByPlayers = true,
	BlizzardNameplate = true,

	-- Blacklists
	blockNonPersonal = true,
	blockCastByPlayers = true,
	blockNoDuration = true,
	blockDispellable = true,
	blockNotDispellable = true,
}
