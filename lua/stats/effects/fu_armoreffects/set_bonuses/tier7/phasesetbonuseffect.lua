require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName="fu_phaseset"

armorBonus={
	{stat ="electricStatusImmunity" , amount = 1 },
	{stat ="biomeelectricImmunity" , amount = 1 },
	{stat ="pressureProtection" , amount = 1 },
	{stat ="extremepressureProtection" , amount = 1 },
	{stat ="critChance" , amount = 3 },
	{stat = "snowslowImmunity", amount = 1},
	{stat = "slushslowImmunity", amount = 1},
	{stat = "blacktarImmunity", amount = 1},
	{stat = "fumudslowImmunity", amount = 1},
	{stat = "fujungleslowImmunity", amount = 1},
	{stat = "quicksandImmunity", amount = 1},
	{stat = "honeyslowImmunity", amount = 1},
	{stat = "iceslipImmunity", amount = 1},
	{stat = "slimestickImmunity", amount = 1}
}

function init()
	setSEBonusInit(setName)
	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		applyFilteredModifiers({speedModifier = 1.2,airJumpModifier = 1.2})
		setRegen(0.008)
	end
end
