local disabled = false

local function Summon()
	if(not disabled and
		not IsMounted() and
		not IsFlying() and
		not InCombatLockdown() and
		not UnitIsDeadOrGhost('player')) then

		for index = 1, GetNumCompanions('CRITTER') do
			local id, _, _, _, called = GetCompanionInfo('CRITTER', index)
			if(id == 16548 and not called) then
				return CallCompanion('CRITTER', index)
			end
		end
	end
end

hooksecurefunc('CameraOrSelectOrMoveStart', Summon)
hooksecurefunc('MoveForwardStart', Summon)
hooksecurefunc('ToggleAutoRun', Summon)
hooksecurefunc('TurnOrActionStart', Summon)

SLASH_AUTOWIGGLES = '/autowiggles'
SlashCmdList.AUTOWIGGLES = function()
	disabled = not disabled
	print('|cffff8080AutoWiggles:|r Automatic spawning is', disabled and 'shut down.' or 'enabled!')
end
