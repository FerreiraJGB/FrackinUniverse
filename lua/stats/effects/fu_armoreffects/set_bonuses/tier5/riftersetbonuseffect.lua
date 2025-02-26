require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName="fu_rifterset"

weaponBonus={
	{stat = "critChance", amount = 3},
	{stat = "powerMultiplier", effectiveMultiplier = 1.25}
}

armorEffect={
	{stat = "protoImmunity", amount = 1.0},
	{stat = "gasImmunity", amount = 1.0},
	{stat = "fallDamageMultiplier", effectiveMultiplier = 0.75}
}

function init()
	setSEBonusInit(setName)
	effectHandlerList.armorEffectHandle=effect.addStatModifierGroup(armorEffect)
	effectHandlerList.weaponBonusHandle=effect.addStatModifierGroup({})
	checkWeapons()
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		checkWeapons()
	end
end

function checkWeapons()
	local weapons=weaponCheck({"magnorb", "magnorbs", "boomerang","chakram"})

	if weapons["either"] then
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,weaponBonus)
	else
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,{})
	end
end
