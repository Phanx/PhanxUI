--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2015 Phanx <addons@phanx.net>. All rights reserved.
	Feel free to use any or all of the code from this addon in your own
	addon, as long as you keep my name out of it.
----------------------------------------------------------------------]]

local cvars = {
	--	Controls
	autoClearAFK        = "1",
	autoDismountFlying  = "0",
	autoDismount        = "0", -- no UI
	autoLootDefault     = "1",
	autoOpenLootHistory = "0",
	autoStand           = "0", -- no UI
	autoUnshift         = "0", -- no UI
	blockChannelInvites = "1",
	blockTrades         = "0",
	deselectOnClick     = "1", -- Sticky Targeting, 0 = ON, 1 = OFF
	interactOnLeftClick = "0",
	lootUnderMouse      = "0",
	synchronizeBindings = "1", -- no UI
	synchronizeConfig   = "1", -- no UI
	synchronizeMacros   = "1", -- no UI
	synchronizeSettings = "1", -- no UI

	--	Combat
	ActionButtonUseKeyDown         = "0",
--	assistAttack                   = "0",
	autoSelfCast                   = "0",
--	displaySpellActivationOverlays = "1",
	lossOfControl                  = "1",
	lossOfControlDisarm            = "2",
	lossOfControlFull              = "2",
	lossOfControlInterrupt         = "2",
	lossOfControlRoot              = "2",
	lossOfControlSilence           = "2",
--	showTargetOfTarget             = "1",
--	spellActivationOverlayOpacity  = "1",
--	stopAutoAttackOnTargetChange   = "0",

	--	Display
	displayFreeBagSlots           = "0",
	displayWorldPVPObjectives     = "2", -- no UI
	dontShowEquipmentSetsOnItems  = "1", -- no UI
	movieSubtitle                 = "1",
--	rotateMinimap                 = "0",
	screenEdgeFlash               = "0", -- no UI
	serviceTypeFilter             = "2", -- no UI
	SpellTooltip_DisplayAvgValues = "1",
	threatShowNumeric             = "1",
	threatPlaySounds              = "0",
	timeMgrUseLocalTime           = "1", -- no UI

	--	Objectives
	autoQuestWatch     = "1",
	autoQuestProgress  = "0", -- no UI
	mapFade            = "0",
--	mapQuestDifficulty = "0",
--	watchFrameWidth    = "1",

	--	Social
	chatBubbles              = "0",
	chatBubblesParty         = "0",
	chatStyle                = "classic",
--	chatTimestamps           = "none",
	colorChatNamesByClass    = "1", -- no UI
	guildMemberNotify        = "0",
	profanityFilter          = "0",
	removeChatDelay          = "1",
	spamFilter               = "1",
	wholeChatWindowClickable = "0", -- no UI

	--	Names
	BloatNameplates            = "1",
	bloatthreat                = "1",
	nameplateMotion            = "2",
	UnitNameOwn                = "0",
	UnitNameGuildTitle         = "0",
	UnitNamePlayerGuild        = "0",
	UnitNamePlayerPVPTitle     = "0",
	UnitNameFriendlyPetName    = "0",
	UnitNameFriendlyPlayerName = "0",
	UnitNameEnemyPlayerName    = "1",
	UnitNameEnemyPetName       = "1",
	UnitNameEnemyGuardianName  = "1",
	UnitNameEnemyTotemName     = "1",

	--	Floating Combat Text
	CombatHealingAbsorbTarget = "0",
	enableCombatText          = "0",
	fctLowManaHealth          = "0",
	fctReactives              = "0",

	--	Unit Frames
--	fullSizeFocusFrame   = "1",
--	showArenaEnemyFrames = "1",
--	showTargetOfTarget   = "1",

	--	Buffs and Debuffs
	consolidateBuffs = "1",

	--	Battle.net
	showToastWindow = "0",

	--	Camera
	cameraDistanceMax       = "50",
	cameraDistanceMaxFactor = "2", -- no UI
	cameraSmoothStyle       = "1", -- Only horizontal when moving
	cameraYawSmoothSpeed    = "90",

	--	Help
	scriptErrors  = "1",
	showTutorials = "0",

	--	Miscellaneous
	addFriendInfoShown = "1",
	screenshotFormat   = "tga",
	screenshotQuality  = "10",
	talentFrameShown   = "1",

	--	Graphics
	ffxGlow             = "0", -- full screen glow
	ffxRectangle        = "1", -- widescreen frame buffer
	groundEffectDist    = "100",
	groundEffectDensity = "128",
--	maxfps              = "30",
	maxfpsbk            = "15",
	pathSmoothing       = "1",
	violenceLevel       = "5", -- min 0, max 5
}

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
	SetAutoDeclineGuildInvites(true)
	ShowAccountAchievements(true) -- show ONLY account achievements
	for k, v in pairs(cvars) do
		local o = GetCVar(k)
		if o == nil then
			print("CVar", k, "doesn't exist!")
		elseif o ~= v then
	--		print("SetCVar", k, v)
			SetCVar(k, v)
		end
	end
end)

hooksecurefunc("SetCVar", function(k, v)
	local o = cvars[k]
	if o and tostring(v) ~= o then
		print("|cffff9f7fSetCVar|r", k, o, "|cffff9f7f==>|r", v)
	end
end)
