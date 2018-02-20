--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2016 Phanx <addons@phanx.net>. All rights reserved.
	Feel free to use any or all of the code from this addon in your own
	addon, as long as you keep my name out of it.
----------------------------------------------------------------------]]

local macros = {
	ALL = {
		Hearth = [[
#showtooltip
/use Hearthstone
]],
		Pet = [[
/petattack [nomod]
/petfollow [mod:shift]
/petmoveto [mod:ctrl]
]],
		SilverDragon = [[
/cleartarget
/click SilverDragonMacroButton
/stopmacro [noexists] [dead]
/run PlaySound("FriendJoinGame") UIErrorsFrame:AddMessage("Found " .. UnitName("target"))
]],
	},
	DRUID = {
		Bear = [[
#showtooltip Bear Form
/dismount
/cancelform
/cast Bear Form
]],
		Cat = [[
#showtooltip Cat Form
/dismount
/cancelform
/cast Cat Form
]],
		Cure = [[
#showtooltip
/stopmacro [form]
/cast [harm] Soothe; [dead, combat] Rebirth; [dead] [mod:shift] Revive; [help,nomod:alt,nobtn:2] [@player] Remove Corruption
]],
		Fin1 = [[
#showtooltip
/cast [mod] [btn:2] Ferocious Bite; Rip
]],
		Fin2 = [[
#showtooltip
/cast [mod] [btn:2] Maim; Savage Roar
]],
		Finish = [[
#showtooltip
/cast [mod:alt] [btn:3] Savage Roar; [mod:ctrl] Maim; [mod:shift] [btn:2] Ferocious Bite; Rip
]],
		Flight = [[
#showtooltip Flight Form
/stopmacro [combat]
/dismount
/cancelform
/cast Flight Form
]],
		Heal = [[
#showtooltip
/cast [help,nomod:alt] [@player] Healing Touch
]],
		Power = [[
#showtooltip
/cast [form:1] Enrage; [form:2] Tiger's Fury
]],
		Q = [[
#showtooltip
/cast [form:1] Growl; [form:2] Prowl
]],
		Swipe = [[
#showtooltip
/stopmacro [noform:1/2]
/cast [mod:alt] [btn:2] Thrash; Swipe
]],
		Travel = [[
#showtooltip Travel Form
/stopmacro [indoors]
/dismount
/cancelform
/cast Travel Form
]],
	},
	SHAMAN = {
		Cure = [[
#showtooltip
/cast [mod:alt, @player] [btn:2, @player] Cleanse Spirit; [harm] Purge; [dead] [mod:shift] Ancestral Spirit; Cleanse Spirit
]],
		Hex = [[
#showtooltip Hex
/stopmacro [@focus, help] [help]
/clearfocus [mod:alt]
/focus [@focus, noexists]
/cast [@focus, exists] [@target, exists] Hex
]],
		Home = [[
#showtooltip
/castsequence [nocombat] reset=900 Astral Recall, Hearthstone
/cast [combat] Hearthstone
]],
		Interrupt = [[
#showtooltip
/stopmacro [noharm]
/stopcasting
/cast Wind Shear
]],
	},
	SHAMAN_2 = {
		["1"] = [[
#showtooltip
/cast [mod:shift] Frostbrand; Flametongue
]],
		["2"] = [[
#showtooltip
/cast [mod:shift] Lightning Bolt; Rockbiter
]],
		["3"] = [[
#showtooltip
/cast [mod:shift] Crash Lightning; Lava Lash
]],
		["4"] = [[
#showtooltip
/cast [mod:shift, mod:alt, @player] [mod:shift, btn:2, @player] [mod:shift] Healing Surge; Stormstrike
]],
	},
	WARLOCK = {
		Demon = [[
#showtooltip
/cast [pet:Imp,@player] [] Command Demon
]],
		Health = [[
#showtooltip
/cast [mod] Create Healthstone
/use [nomod] Healthstone
]],
		Sac = [[
#showtooltip
/cast Sacrificial Pact
/run PetDismiss()
]],
		Teleport = [[
#showtooltip
/cast [mod:shift] Demonic Circle: Summon
/stopmacro [mod:shift]
/stopcasting
/cast Demonic Circle: Teleport
]],
	},
	WARLOCK_KANRETHAD = {
		Breath = [[
#showtooltip
/cast [@player] Fel Flame Breath
]],
		Charge = [[
#showtooltip
/target Kanrethad
/petattack
/cast Charge
]],
		Doom = [[
#showtooltip
/target Doom Lord
/cast Banish
]],
		Heal = [[
#showtooltip
/cast Demonic Siphon
]],
	},
}

local f = CreateFrame("Frame")

local function LoadMacros(macros, global)
	if type(macros) ~= "table" then
		return
	end

	for name, body in pairs(macros) do
		local index = GetMacroIndexByName(name) or 0
		if index == 0 then
			print("Restoring macro:", name)
			CreateMacro(name, "INV_MISC_QuestionMark", body, not global)
		end
	end
end

function f.LoadMacros()
	if InCombatLockdown() then
		return f:RegisterEvent("PLAYER_REGEN_ENABLED")
	end

	LoadMacros(macros.ALL, true)

	local _, class = UnitClass("player")
	LoadMacros(macros[class])

	local spec = GetSpecialization() or 0
	LoadMacros(macros[class .. "_" .. spec])
end

f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(f, event, ...)
	f.LoadMacros()
end)
