require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName="fu_stalwartset"

armorBonus={
	{stat="shortspearMastery",amount=0.15 },
	{stat="grit",amount=0.15 },
	{stat="protection",effectiveMultiplier=1.15 }
}

weaponBonus={
	{stat="powerMultiplier",effectiveMultiplier=1.15 }
}

function init()
	setSEBonusInit(setName)
	effectHandlerList.weaponBonus1Handle=effect.addStatModifierGroup({})

	checkWeapons()

	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		checkWeapons()
	end
end

function checkWeapons()
	local weapons=weaponCheck({ "spear", "shortspear", "lance" })
	if weapons["either"] then
		effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle,weaponBonus)
	else
		effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle,{})
	end
end