--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2014 Phanx <addons@phanx.net>. All rights reserved.
	Feel free to use any or all of the code from this addon in your own
	addon, as long as you keep my name out of it.
----------------------------------------------------------------------]]

local bindings = {
	-- Movement Keys
	["E"]              = "MOVEFORWARD",
	["CTRL-E"]         = "TOGGLEAUTORUN",
	["BUTTON4"]        = "TOGGLEAUTORUN",
	["CTRL-SHIFT-E"]   = "TOGGLERUN",
	["S"]              = "MOVEBACKWARD",
	["SHIFT-S"]        = "SITORSTAND",
	["A"]              = "STRAFELEFT",
	["SHIFT-A"]        = "TURNLEFT",
	["D"]              = "STRAFERIGHT",
	["SHIFT-D"]        = "TURNRIGHT",
	["SPACE"]          = "JUMP",

	-- Chat
	["ENTER"]          = "OPENCHAT",
	["/"]              = "OPENCHATSLASH",
	["SHIFT-R"]        = "REPLY",

	-- Action Bar
	["1"]                   = "ACTIONBUTTON1",
	["2"]                   = "ACTIONBUTTON2",
	["3"]                   = "ACTIONBUTTON3",
	["4"]                   = "ACTIONBUTTON4",
	["5"]                   = "ACTIONBUTTON5",
	["6"]                   = "ACTIONBUTTON6",
	["ALT-Q"]               = "EXTRAACTIONBUTTON1",
	["SHIFT-UP"]            = "PREVIOUSACTIONPAGE",
	["SHIFT-MOUSEWHEELUP"]  = "PREVIOUSACTIONPAGE",
	["SHIFT-DOWN"]          = "NEXTACTIONPAGE",
	["SHIFT-MOUSEWHEELDOWN"]= "NEXTACTIONPAGE",

	-- Targeting
	["TAB"]            = "TARGETNEARESTENEMY",
	["SHIFT-TAB"]      = "TARGETNEARESTFRIEND",

	-- Targeting / Nameplates
	["SHIFT-V"]        = "NAMEPLATES",
	["CTRL-V"]         = "FRIENDNAMEPLATES",

	-- Targeting / Interaction
	["T"]              = "STARTATTACK",
	["ALT-T"]          = "ASSISTTARGET",
	["ALT-SHIFT-T"]    = "INTERACTTARGET",

	-- Interface Panels
	["ESCAPE"]         = "TOGGLEGAMEMENU",
	["B"]              = "OPENALLBAGS",
	["M"]              = "TOGGLEWORLDMAP",
	["SHIFT-M"]        = "TOGGLEBATTLEFIELDMINIMAP",
	["CTRL-M"]         = "TOGGLEENCOUNTERJOURNAL",
	["CTRL-SHIFT-M"]   = "TOGGLEGARRISONLANDINGPAGE",
	["ALT-SHIFT-M"]    = "TOGGLEWORLDSTATESCORES",
	["F6"]             = "TOGGLECHARACTER0",
	["F7"]             = "TOGGLESPELLBOOK",
	["SHIFT-F7"]       = "TOGGLECOLLECTIONSMOUNTJOURNAL",
	["CTRL-F7"]        = "TOGGLECOLLECTIONSPETJOURNAL",
	["CTRL-SHIFT-F7"]  = "TOGGLECOLLECTIONSTOYBOX",
	["F8"]             = "TOGGLETALENTS",
	["SHIFT-F8"]       = "TOGGLEINSCRIPTION",
	["F9"]             = "TOGGLEQUESTLOG",
	["F10"]            = "TOGGLESOCIAL",
	["SHIFT-F10"]      = "TOGGLEGUILDTAB",
	["F11"]            = "TOGGLEDUNGEONSANDRAIDS",
	["SHIFT-F11"]      = "TOGGLECHARACTER4",
	["F12"]            = "TOGGLEACHIEVEMENT",

	-- Miscellaneous
	["`"]              = "DISMOUNT",
	["ALT-Z"]          = "TOGGLEUI",
	["CTRL-R"]         = "TOGGLEFPS",
	["PRINTSCREEN"]    = "SCREENSHOT",

	-- Camera
	["MOUSEWHEELUP"]   = "CAMERAZOOMIN",
	["MOUSEWHEELDOWN"] = "CAMERAZOOMOUT",

	-- Vehicle Controls
	["CTRL-MOUSEWHEELUP"]   = "VEHICLEAIMUP",
	["CTRL-MOUSEWHEELDOWN"] = "VEHICLEAIMDOWN",

	-- Addons
	["SHIFT-B"]        = "BAGNON_BANK_TOGGLE",
	["ALT-CTRL-F"]     = "GOFISH_TOGGLE",
	["ALT-SHIFT-F"]    = "HYDRA_FOLLOW_TARGET",
	["CTRL-F"]         = "HYDRA_FOLLOW_ME",
	["I"]              = "EXAMINER_TARGET",
	["ALT-I"]          = "EXAMINER_MOUSEOVER",
	["ALT-SHIFT-L"]    = "CLICK LevelFlightButton:LeftButton",
	["ALT-N"]          = "NOTEBOOK_PANEL",
}

local modifiedClicks = {
	AUTOLOOTTOGGLE   = "SHIFT",
	CHATLINK         = "SHIFT",
	COMPAREITEMS     = "SHIFT",
	DRESSUP          = "CTRL",
	-- FOCUSCAST not personally used, not set by default
	OPENALLBAGS      = "SHIFT", -- only affects clicking on default bag bar buttons
	PICKUPACTION     = "SHIFT",
	QUESTWATCHTOGGLE = "SHIFT",
	SELFCAST         = "ALT",
	SHOWITEMFLYOUT   = "CTRL", -- TODO
	-- SHOWMULTICASTFLYOUT obsolete since 4.0
	SOCKETITEM       = "CTRL",
	SPLITSTACK       = "SHIFT",
	-- STICKYCAMERA unknown
	TOKENWATCHTOGGLE = "SHIFT",
}

local PhanxUI = CreateFrame("Frame", "PhanxUI")

PhanxUI:RegisterEvent("PLAYER_LOGIN")
PhanxUI:SetScript("OnEvent", function(self) C_Timer.After(5, function()
	local changes

	local function CheckBinding(command, header, key, ...)
		if not key then return end

		local current = bindings[key]
		if current == nil then
			print("REMOVE", key, command)
			changes = true
			SetBinding(key)
		elseif current == command then
			bindings[key] = false -- already set
		end

		if (...) then
			return CheckBinding(command, header, ...)
		end
	end

	for i = 1, GetNumBindings() do
		CheckBinding(GetBinding(i))
	end

	for key, command in pairs(bindings) do
		if command then
			--print("RESTORE", key, command)
			changes = true
			SetBinding(key, command)
		end
	end

	-- Something is unsetting these, and it's not an addon.
	for action, key in pairs(modifiedClicks) do
		if GetModifiedClick(action) ~= key then
			print("FIXED", action, key)
			changes = true
			SetModifiedClick(action, key)
		end
	end

	if changes then
		SaveBindings(1)
	end
end) end)

SetBinding("ESCAPE", "TOGGLEGAMEMENU")
SetBinding("ENTER", "OPENCHAT")
SetBinding("/", "OPENCHATSLASH")

------------------------------------------------------------------------
--	ClearAllBindings()
--		Removes all bindings, and then applies the following bindings:
--			[1] ESCAPE -> Toggle main menu
--			[2] ENTER -> Open chat
--			[3] / -> Open chat with a pre-filled slash
------------------------------------------------------------------------

function PhanxUI:ClearAllBindings()
	for i = 1, GetNumBindings() do
		for j = select("#", GetBinding(i)), 3, -1 do
			local b = select(j, GetBinding(i))
			if b then
				SetBinding(b)
			end
		end
	end
	SetBinding("ESCAPE", "TOGGLEGAMEMENU")
	SetBinding("ENTER", "OPENCHAT")
	SetBinding("/", "OPENCHATSLASH")
end

------------------------------------------------------------------------
--	GetBindingFriendlyActionText(command)
--		Turns a binding command into a human-readable description of
--		the action to be performed when the binding is activated.
--		Accepts:
--			[1] command (string)
--		Returns:
--			[1] text (string)
------------------------------------------------------------------------

function PhanxUI:GetBindingFriendlyActionText(command)
	local action, target = command:match("^(%S+) ?(.*)$")
	if action == "CLICK" then
		local button, click = target:match("([^:]+):?(.*)")
		return format("Click %s with %s", click or "LeftButton", button)
	elseif action == "ITEM" then
		return format("Use item %s", target)
	elseif action == "MACRO" then
		return format("Run macro %s", target)
	elseif action == "SPELL" then
		return format("Cast spell %s", target)
	elseif action:sub(1, 12) == "ACTIONBUTTON" then
		action = tonumber(action:match("%d+"))
		local type, spell, subtype = GetActionInfo(action)
		if type == "companion" then
			spell = select(2, GetCompanionInfo("CRITTER", spell))
			return format("Summon %s %s", subtype == "CRITTER" and "companion" or "mount", spell)
		elseif type == "equipmentset" then
			return format("Equip set %s", spell)
		elseif type == "item" then
			spell = GetItemInfo(spell)
			return format("Use item %s", spell)
		elseif type == "macro" then
			spell = GetMacroInfo(spell)
			return format("Run macro %s", spell)
		elseif type == "spell" then
			spell = GetSpellInfo(spell)
			return format("Cast spell %s", spell)
		else
			return GetBindingText(command, "BINDING_NAME_")
		end
	elseif action:sub(1, 18) == "BONUSACTIONBUTTON" then
		action = tonumber(action:match("%d+"))
		local skill = GetPetActionInfo(action)
		if action then
			return format("Use pet action %s", action)
		else
			return GetBindingText(command, "BINDING_NAME_")
		end
	elseif action:sub(1, 16) == "SHAPESHIFTBUTTON" then
		action = tonumber(action:match("%d+"))
		local form = select(2, GetShapeshiftFormInfo(action))
		if form then
			return format("Change stance to %s", form)
		else
			return GetBindingText(command, "BINDING_NAME_")
		end
	else
		return GetBindingText(command, "BINDING_NAME_")
	end
end

------------------------------------------------------------------------
--	DumpBindings(raw)
--		Lists all currently active bindings and their descriptions.
--		Accepts:
--			[1] raw (boolean)
--				Controls whether binding commands and descriptions
--				are converted into friendly texts or listed as-is.
--		Returns:
--			none
------------------------------------------------------------------------

function PhanxUI:DumpBindings(raw)
	for i = 1, GetNumBindings() do
		local command = GetBinding(i)
		if command ~= "NONE" then
			for j = 3, select("#", GetBinding(i)) do
				local key = select(j, GetBinding(i))
				if raw then
					print(key, "==>", command)
				else
					print(GetBindingText(key, "KEY_"), "==>", self:GetBindingFriendlyActionText(command))
				end
			end
		end
	end
end