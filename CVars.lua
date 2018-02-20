--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2017 Phanx <addons@phanx.net>. All rights reserved.
	Feel free to use any or all of the code from this addon in your own
	addon, as long as you keep my name out of it.
----------------------------------------------------------------------]]

local cvars = {
	-- Controls
	autoClearAFK        = "1",
	autoDismountFlying  = "0",
	autoDismount        = "0", -- no UI
	autointeract        = "0",
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

	-- Combat
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
--	spellActivationOverlayOpacity  = "1",
--	stopAutoAttackOnTargetChange   = "0",

	-- Display
	displayFreeBagSlots           = "0",
	displayWorldPVPObjectives     = "2", -- no UI
	dontShowEquipmentSetsOnItems  = "1", -- no UI
	movieSubtitle                 = "1",
	Outline                       = "1", -- Quest Objectives Only
	screenEdgeFlash               = "0", -- no UI
	serviceTypeFilter             = "2", -- no UI
	showQuestTrackingTooltips     = "0", -- no UI
	threatShowNumeric             = "1",
	threatPlaySounds              = "0",
	timeMgrUseLocalTime           = "1", -- no UI

	-- Objectives
	autoQuestWatch     = "1",
	autoQuestProgress  = "0", -- no UI
	mapFade            = "0",
--	mapQuestDifficulty = "0",
	trackQuestSorting  = "proximity",
--	watchFrameWidth    = "1",

	-- Social
	chatBubbles              = "0",
	chatBubblesParty         = "0",
	chatStyle                = "classic",
--	chatTimestamps           = "none",
	colorChatNamesByClass    = "1", -- no UI
	guildMemberNotify        = "0",
	profanityFilter          = "0",
	removeChatDelay          = "1",
	showToastWindow          = "0",
	spamFilter               = "1",
	wholeChatWindowClickable = "0", -- no UI

	-- Floating Combat Text
	enableFloatingCombatText        = "0",
	floatingCombatTextCombatDamageDirectionalScale = "0", -- disable fountain spray effect
	floatingCombatTextCombatHealingAbsorbTarget    = "0",
	floatingCombatTextLowManaHealth = "0",
	floatingCombatTextReactives     = "0",

	-- Nameplates
	nameplateMotion              = "1", -- Stacking, not Overlapping
	nameplateOtherBottomInset    = "-1", -- don't stick nameplates to the screen edges for offscreen mobs
	nameplateOtherTopInset       = "-1",
	nameplateShowAll             = "1", -- always show nameplates, not just in combat, if they're enabled
	nameplateShowEnemyMinions    = "1",
	nameplateShowEnemyMinus      = "1",
	nameplateShowSelf            = "0",

	-- Unit Frames
	fullSizeFocusFrame   = "1",
--	showArenaEnemyFrames = "1",
	showTargetOfTarget   = "1",
	
	-- Unit Names
	UnitNameOwn                  = "0",
	UnitNameGuildTitle           = "0",
	UnitNamePlayerGuild          = "0",
	UnitNamePlayerPVPTitle       = "0",
	UnitNameFriendlyGuardianName = "0",
	UnitNameFriendlyPetName      = "0",
	UnitNameFriendlyPlayerName   = "0",
	UnitNameFriendlyTotemName    = "0",
	UnitNameEnemyPlayerName      = "1",
	UnitNameEnemyPetName         = "1",
	UnitNameEnemyGuardianName    = "1",
	UnitNameEnemyTotemName       = "1",
	UnitNameFriendlySpecialNPCName = "1", -- Quest NPCs
	UnitNameHostleNPC = "1", -- typo accurate
	UnitNameInteractiveNPC       = "0",
	UnitNameNPC                  = "0",
	ShowQuestUnitCircles         = "1",

	-- Camera
--	cameraDistanceMaxFactor = "1.5", -- no UI, range seems to be 0-2 exclusive -- removed in 7.1

	-- Help
	scriptErrors  = "1",
	showTutorials = "0",

	-- Miscellaneous
	addFriendInfoShown = "1",
	screenshotFormat   = "tga",
	screenshotQuality  = "10",
	talentFrameShown   = "1",

	-- Graphics
	ffxGlow             = "0", -- full screen glow
	groundEffectDist    = "100",
	groundEffectDensity = "128",
--	maxfps              = "30",
	maxfpsbk            = "15",
	pathSmoothing       = "1",
	uiscale             = "0.8",
	useUiScale          = "1", -- never wanted this before, but its behavior is different in 7.1
	violenceLevel       = "5", -- min 0, max 5
}

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
	SetAutoDeclineGuildInvites(true)
	ShowAccountAchievements(true) -- show ONLY account achievements

	for cvar, value in pairs(cvars) do
		local current = tostring(GetCVar(cvar))
		if current ~= value then
			--print("SetCVar", cvar, value)
			SetCVar(cvar, value)
		end
	end
end)

hooksecurefunc("SetCVar", function(k, v)
	local o = cvars[k]
	if o and tostring(v) ~= o then
		print("|cffff9f7fSetCVar|r", k, o, "|cffff9f7f==>|r", v)
	end
end)
