function init()
  object.setInteractive(config.getParameter("interactive", true))
  if storage.state == nil then
    output(config.getParameter("defaultSwitchState", false))
  else
    output(storage.state)
  end

  if storage.triggered == nil then
    storage.triggered = false
  end
end

function onInteraction(args)
  output(not storage.state)
end

function onNpcPlay(npcId)
end

function output(state)
  storage.state = state
  if state then
    animator.setAnimationState("switchState", "on")
    animator.playSound("on");
    object.setAllOutputNodes(true)
  else
    animator.setAnimationState("switchState", "off")
    animator.playSound("off");
    object.setAllOutputNodes(false)
  end
end

function update(dt)
  if object.getInputNodeLevel(0) and not storage.triggered then
    storage.triggered = true
    output(not storage.state)
  elseif storage.triggered and not object.getInputNodeLevel(0) then
    storage.triggered = false
  end
end
