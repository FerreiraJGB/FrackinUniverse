require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName="fu_hackerset"

armorBonus={
	{stat="energyRegenPercentageRate",baseMultiplier=1.25 },
	{stat="gasImmunity",amount=1}
}

weaponBonus={
	{stat="critChance",amount=1 }
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
	local weapons=weaponCheck({ "flail" })
	if weapons["either"] then
		effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle,weaponBonus)
	else
		effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle,{})
	end
end