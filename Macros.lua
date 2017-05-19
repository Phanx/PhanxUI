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
#show Bear Form
/dismount
/cancelform
/cast Bear Form
		]],
		Cat = [[
#show Cat Form
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
#show Flight Form
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
#show Travel Form
/stopmacro [indoors]
/dismount
/cancelform
/cast Travel Form
		]],
	},
	SHAMAN = {
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

function f.LoadMacros()
	if InCombatLockdown() then
		return f:RegisterEvent("PLAYER_REGEN_ENABLED")
	end
	for name, body in pairs(macros.ALL) do
		local index = GetMacroIndexByName(name)
		if not index then
			CreateMacro(name, "INV_MISC_QuestionMark", body)
		end
	end
	local _, class = UnitClass("player")
	if macros[class] then
		for name, body in pairs(macros[class]) do
			local index = GetMacroIndexByName(name)
			if not index then
				CreateMacro(name, "INV_Misc_QuestionMark", body, true)
			end
		end
	end
end

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("VARIABLES_LOADED")
f:SetScript("OnEvent", function(f, event, ...)
	local numAccountMacros, numCharMacros = GetNumMacros()
	print(event, numAccountMacros, numCharMacros)
end)
