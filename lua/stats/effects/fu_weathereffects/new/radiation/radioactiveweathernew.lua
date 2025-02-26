require("/scripts/vec2.lua")
require("/stats/effects/fu_weathereffects/new/fuWeatherBase.lua")

--============================= CLASS DEFINITION ============================--
--[[ This instantiates a child class of fuWeatherBase. The child's metatable
    is set to the parent's, so that any missing indexes (methods) are looked
    up from fuWeatherBase. The methods can also be accessed manually (in cases
    that extend the parent method) through the child.parent attribute. ]]--

fuRadioactiveWeather = fuWeatherBase:new({})

--============================= CLASS EXTENSIONS ============================--
--[[ Any methods which need to be overridden from fuWeatherBase should be
    defined in this section. ]]--

--[[ NOTE: When calling parent methods, use the syntax
        self.parent.method(self)
    rather than the conventional "syntactic sugar version"
        self.parent:method()
    The latter will pass the parent class as the "self" parameter, preventing
    any attributes overwritten by the child from being used. ]]--

--============================= GRAPHICAL EFFECTS ============================--

function fuRadioactiveWeather.activateVisualEffects(self)
  effect.setParentDirectives("fade=33dd15=0.4")
  animator.setParticleEmitterOffsetRegion("radioactivebreath", mcontroller.boundBox())
  animator.setParticleEmitterActive("radioactivebreath", true)
end

function fuRadioactiveWeather.deactivateVisualEffects(self)
  effect.setParentDirectives("fade=33dd15=0")
  animator.setParticleEmitterActive("radioactivebreath", false)
end

function fuRadioactiveWeather.createAlert(self)
	if entity.entityType()=="player" then
		animator.playSound("bolt")
		local statusTextRegion = { 0, 1, 0, 1 }
		animator.setParticleEmitterOffsetRegion("statustext", statusTextRegion)
		animator.burstParticleEmitter("statustext")
		configBombDrop = {}
		world.spawnProjectile("maxhealthdown", mcontroller.position(), entity.id(), {0, 60}, false, configBombDrop)
	end
end

--============================== INIT AND UNINIT =============================--
--[[ Starbound calls these non-class functions when handling status effects.
    They should not need to be modified (apart from the class name). ]]--

function init()
  local config_file = config.getParameter("configPath")
  fuRadioactiveWeather:init(tostring(config_file))
end

function uninit()
  fuRadioactiveWeather:uninit()
end

--=========================== MAIN UPDATE FUNCTION ==========================--
--[[ Starbound calls this non-class function when updating status effects. It
    shouldn't need to be modified (apart from the class name). ]]--

function update(dt)
  fuRadioactiveWeather:update(dt)
end
