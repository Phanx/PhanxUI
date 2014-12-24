--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2014 Phanx <addons@phanx.net>. All rights reserved.
	Feel free to use any or all of the code from this addon in your own
	addon, as long as you keep my name out of it.
----------------------------------------------------------------------]]

local PhanxUI = CreateFrame("Frame", "PhanxUI")

PhanxUI:RegisterEvent("PLAYER_LOGIN")
PhanxUI:SetScript("OnEvent", function(self)
	C_Timer.After(random(100,200)/100, function()
		self:ApplyMyBindings(true)
		self:ApplyDefaultActionBindings(nil, true)
		SaveBindings(1)
	end)
end)

SetBinding("ESCAPE", "TOGGLEGAMEMENU")
SetBinding("/", "OPENCHATSLASH")

function PhanxUI:ApplyMyBindings(silent)
	self:ClearAllBindings()

	-- Movement Keys
	SetBinding("E",            "MOVEFORWARD")
	SetBinding("CTRL-E",       "TOGGLEAUTORUN")
	SetBinding("BUTTON4",      "TOGGLEAUTORUN")
	SetBinding("CTRL-SHIFT-E", "TOGGLERUN")
	SetBinding("S",            "MOVEBACKWARD")
	SetBinding("SHIFT-S",      "SITORSTAND")
	SetBinding("A",            "STRAFELEFT")
	SetBinding("SHIFT-A",      "TURNLEFT")
	SetBinding("D",            "STRAFERIGHT")
	SetBinding("SHIFT-D",      "TURNRIGHT")
	SetBinding("SPACE",        "JUMP")

	-- Chat
	SetBinding("ENTER",  "OPENCHAT")
	SetBinding("/",       "OPENCHATSLASH")
	SetBinding("SHIFT-R", "REPLY")

	-- Action Bar
	SetBinding("ALT-Q",                "EXTRAACTIONBUTTON1")
	SetBinding("SHIFT-UP",             "PREVIOUSACTIONPAGE")
	SetBinding("SHIFT-MOUSEWHEELUP",   "PREVIOUSACTIONPAGE")
	SetBinding("SHIFT-DOWN",           "NEXTACTIONPAGE")
	SetBinding("SHIFT-MOUSEWHEELDOWN", "NEXTACTIONPAGE")

	-- Targeting
	SetBinding("TAB",       "TARGETNEARESTENEMY")
	SetBinding("SHIFT-TAB", "TARGETNEARESTFRIEND")

	-- Targeting / Nameplates
	SetBinding("SHIFT-V", "NAMEPLATES")
	SetBinding("CTRL-V",  "FRIENDNAMEPLATES")

	-- Targeting / Interaction
	SetBinding("T",           "STARTATTACK")
	SetBinding("ALT-T",       "ASSISTTARGET")
	SetBinding("ALT-SHIFT-T", "INTERACTTARGET")

	-- Interface Panels
	SetBinding("ESCAPE",        "TOGGLEGAMEMENU")
	SetBinding("B",             "OPENALLBAGS")
	SetBinding("M",             "TOGGLEWORLDMAP")
	SetBinding("SHIFT-M",       "TOGGLEBATTLEFIELDMINIMAP")
	SetBinding("CTRL-M",        "TOGGLEENCOUNTERJOURNAL")
	SetBinding("CTRL-SHIFT-M",  "TOGGLEGARRISONLANDINGPAGE")
	SetBinding("ALT-SHIFT-M",   "TOGGLEWORLDSTATESCORES")
	SetBinding("F6",            "TOGGLECHARACTER0")
	SetBinding("F7",            "TOGGLESPELLBOOK")
	SetBinding("SHIFT-F7",      "TOGGLECOLLECTIONSMOUNTJOURNAL")
	SetBinding("CTRL-F7",       "TOGGLECOLLECTIONSPETJOURNAL")
	SetBinding("CTRL-SHIFT-F7", "TOGGLECOLLECTIONSTOYBOX")
	SetBinding("F8",            "TOGGLETALENTS")
	SetBinding("SHIFT-F8",      "TOGGLEINSCRIPTION")
	SetBinding("F9",            "TOGGLEQUESTLOG")
	SetBinding("F10",           "TOGGLESOCIAL")
	SetBinding("SHIFT-F10",     "TOGGLEGUILDTAB")
	SetBinding("F11",           "TOGGLEDUNGEONSANDRAIDS")
	SetBinding("SHIFT-F11",     "TOGGLECHARACTER4")
	SetBinding("F12",           "TOGGLEACHIEVEMENT")

	-- Miscellaneous
	SetBinding("`",           "DISMOUNT")
	SetBinding("ALT-Z",       "TOGGLEUI")
	SetBinding("CTRL-R",      "TOGGLEFPS")
	SetBinding("PRINTSCREEN", "SCREENSHOT")

	-- Camera
	SetBinding("MOUSEWHEELUP",   "CAMERAZOOMIN")
	SetBinding("MOUSEWHEELDOWN", "CAMERAZOOMOUT")

	-- Vehicle Controls
	SetBinding("CTRL-MOUSEWHEELUP",   "VEHICLEAIMUP")
	SetBinding("CTRL-MOUSEWHEELDOWN", "VEHICLEAIMDOWN")

	-- Addons
	SetBinding("SHIFT-B",     "BAGNON_BANK_TOGGLE")
	SetBinding("ALT-CTRL-F",  "GOFISH_TOGGLE")
	SetBinding("ALT-SHIFT-F", "HYDRA_FOLLOW")
	SetBinding("CTRL-F",      "HYDRA_FOLLOW_ME")
	SetBinding("I",           "EXAMINER_TARGET")
	SetBinding("ALT-I",       "EXAMINER_MOUSEOVER")
	SetBinding("ALT-SHIFT-L", "CLICK LevelFlightButton:LeftButton")
	SetBinding("ALT-N",       "NOTEBOOK_PANEL")

	if not silent then
		print("Bindings applied.")
	end
end

function PhanxUI:ApplyDefaultActionBindings(full, silent)
	SetBinding("1", "ACTIONBUTTON1")
	SetBinding("2", "ACTIONBUTTON2")
	SetBinding("3", "ACTIONBUTTON3")
	SetBinding("4", "ACTIONBUTTON4")
	SetBinding("5", "ACTIONBUTTON5")
	SetBinding("6", "ACTIONBUTTON6")

	if not full then
		if not silent then
			print("Bindings applied for action buttons 1-6.")
		end
		return
	end

	SetBinding("7", "ACTIONBUTTON7")
	SetBinding("8", "ACTIONBUTTON8")
	SetBinding("9", "ACTIONBUTTON9")
	SetBinding("0", "ACTIONBUTTON10")
	SetBinding("-", "ACTIONBUTTON11")
	SetBinding("=", "ACTIONBUTTON12")

	if not silent then
		print("Bindings applied for action buttons 1-12.")
	end
end

------------------------------------------------------------------------
--	ClearAllBindings()
--		Removes all bindings, and then applies the following bindings:
--			[1] ESC -> Toggle main menu
--			[2] / -> Open chat input box with a pre-filled slash
------------------------------------------------------------------------

function PhanxUI:ClearAllBindings()
	for i = 1, GetNumBindings() do
		for j = select("#", GetBinding(i)), 2, -1 do
			local b = select(j, GetBinding(i))
			if b then
				SetBinding(b)
			end
		end
	end
	SetBinding("ESCAPE", "TOGGLEGAMEMENU")
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
			for j = 2, select("#", GetBinding(i)) do
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