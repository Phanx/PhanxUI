--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2015 Phanx <addons@phanx.net>. All rights reserved.
	Feel free to use any or all of the code from this addon in your own
	addon, as long as you keep my name out of it.
----------------------------------------------------------------------]]

do return end -- not ready for primetime

local macros = {
	GLOBAL = {
		Home = [[
#showtooltip
/use Hearthstone
		]],
		SilverDragon = [[
/cleartarget
/click SilverDragonMacroButton
/stopmacro [noexists] [dead]
/run PlaySound("FriendJoinGame") UIErrorsFrame:AddMessage("Found " .. UnitName("target"))
		]],
		TradeSkillUp = [[
/run if SKILLUPSTEP == 3 then StaticPopup1Button1:Click() SKILLUPSTEP = 1 elseif SKILLUPSTEP == 2 then GetMouseFocus():Click() SKILLUPSTEP = 3 else TradeSkillCreateButton:Click() SKILLUPSTEP = 2 end
		]],
	},
	WARLOCK = {
		Attack = [[
/petfollow [mod:shift]
/petmoveto [mod:ctrl]
/petattack [nomod]
		]],
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
		Demon = [[
#showtooltip
/cast [pet:Imp,@player] [] Shadow Lock
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
		Imps = [[
#showtooltip
/target Wild Imp
/petattack
/cast Fel Flame Breath
		]],
		Nuke = [[
#showtooltip
/cast [btn:2] [mod] Shadowburn; Chaos Bolt
		]],
		Pit = [[
#showtooltip
/run PetDismiss()
/target Pit Lord
/cast Enslave Demon
		]],
		Power = [[
#showtooltip Dark Soul: Instability
/stopmacro [nocombat]
/cast Dark Soul: Instability
		]],
		Sac = [[
#showtooltip
/cast Sacrificial Pact
/run PetDismiss()
		]],
		Soulshatter = [[
#showtooltip
/stopmacro [nocombat]
/stopcasting
/cast Soulshatter
/run print(">> Soulshatter")
		]],
		Teleport = [[
#showtooltip
/cast [mod:shift] Demonic Circle: Summon
/stopmacro [mod:shift]
/stopcasting
/cast Demonic Circle: Teleport
		]],
	},
	SHAMAN = {
	},
}
