--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2016 Phanx <addons@phanx.net>. All rights reserved.
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
	},
	WARLOCK = {
		Attack = [[
/petfollow [mod:shift]
/petmoveto [mod:ctrl]
/petattack [nomod]
		]],
		KBreath = [[
#showtooltip
/cast [@player] Fel Flame Breath
		]],
		KCharge = [[
#showtooltip
/target Kanrethad
/petattack
/cast Charge
		]],
		Demon = [[
#showtooltip
/cast [pet:Imp,@player] [] Command Demon
		]],
		KDoom = [[
#showtooltip
/target Doom Lord
/cast Banish
		]],
		KHeal = [[
#showtooltip
/cast Demonic Siphon
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
	SHAMAN = {
	},
}
