--[[--------------------------------------------------------------------
	PhanxUI
	Hardcoded personal UI setup.
	Copyright (c) 2007-2015 Phanx <addons@phanx.net>. All rights reserved.
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

	-- Tab Targeting
	TargetNearestUseOld            = "1",
--	TargetPriorityAllowAnyOnScreen = "1", -- removed in 7.1

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
--	rotateMinimap                 = "0",
	screenEdgeFlash               = "0", -- no UI
	serviceTypeFilter             = "2", -- no UI
	showQuestTrackingTooltips     = "0", -- no UI
	SpellTooltip_DisplayAvgValues = "1",
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
--	nameplateMotion              = "2",
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

	-- Camera
--	cameraDistanceMaxFactor = "1.5", -- no UI, range seems to be 0-2 exclusive -- removed in 7.1
	cameraSmoothStyle       = "1",   -- Only horizontal when moving
	cameraYawSmoothSpeed    = "90",

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
	ffxRectangle        = "1", -- widescreen frame buffer
	groundEffectDist    = "100",
	groundEffectDensity = "128",
--	maxfps              = "30",
	maxfpsbk            = "15",
	pathSmoothing       = "1",
	violenceLevel       = "5", -- min 0, max 5
}

local bvars = {
	-- Suppress annoying help popups
	closedInfoFrames = {
		[LE_FRAME_TUTORIAL_TALENT] = true,
		[LE_FRAME_TUTORIAL_SPEC] = true,
		[LE_FRAME_TUTORIAL_GLYPH] = true,
		[LE_FRAME_TUTORIAL_SPELLBOOK] = true,
		[LE_FRAME_TUTORIAL_PROFESSIONS] = true,
		[LE_FRAME_TUTORIAL_CORE_ABILITITES] = true,
		[LE_FRAME_TUTORIAL_PET_JOURNAL] = true,
		[LE_FRAME_TUTORIAL_WHAT_HAS_CHANGED] = true,
		[LE_FRAME_TUTORIAL_GARRISON_BUILDING] = true,
		[LE_FRAME_TUTORIAL_GARRISON_MISSION_LIST] = true,
		[LE_FRAME_TUTORIAL_GARRISON_MISSION_PAGE] = true,
		[LE_FRAME_TUTORIAL_GARRISON_LANDING] = true,
		[LE_FRAME_TUTORIAL_GARRISON_ZONE_ABILITY] = true,
		[LE_FRAME_TUTORIAL_WORLD_MAP_FRAME] = true,
		[LE_FRAME_TUTORIAL_CLEAN_UP_BAGS] = true,
		[LE_FRAME_TUTORIAL_BAG_SETTINGS] = true,
		[LE_FRAME_TUTORIAL_REAGENT_BANK_UNLOCK] = true,
		[LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL] = true,
		[LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL_TAB] = true,
		[LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL_LEVEL] = true,
		[LE_FRAME_TUTORIAL_TOYBOX_FAVORITE] = true,
		[LE_FRAME_TUTORIAL_TOYBOX_MOUSEWHEEL_PAGING] = true,
		[LE_FRAME_TUTORIAL_LFG_LIST] = true,
		[LE_FRAME_TUTORIAL_TOYBOX] = true,
		[LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL] = true,
		[LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL_TAB] = true,
		[LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL_LEVEL] = true,
		[LE_FRAME_TUTORIAL_GAME_TIME_AUCTION_HOUSE] = true,
		[LE_FRAME_TUTORIAL_TRANSMOG_JOURNAL_TAB] = true,
		[LE_FRAME_TUTORIAL_TRANSMOG_MODEL_CLICK] = true,
		[LE_FRAME_TUTORIAL_TRANSMOG_SPECS_BUTTON] = true,
		[LE_FRAME_TUTORIAL_TRANSMOG_OUTFIT_DROPDOWN] = true,
	}
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

	for cvar, fields in pairs(bvars) do
		for field, value in pairs(fields) do
			local current = GetCVarBitfield(cvar, field)
			if current ~= value then
				--print("SetCVarBitfield", cvar, field, value)
				SetCVarBitfield(cvar, field, value)
			end
		end
	end
end)

hooksecurefunc("SetCVar", function(k, v)
	local o = cvars[k]
	if o and tostring(v) ~= o then
		print("|cffff9f7fSetCVar|r", k, o, "|cffff9f7f==>|r", v)
	end
end)
