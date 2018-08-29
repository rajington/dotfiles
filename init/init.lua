-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, 'F17')

keys = { 'q', 'w', 'e', 'a', 's', 'd', 'z', 'x', 'c', 'tab', 'space' }
for i, key in ipairs(keys) do
  k:bind({}, key, nil, function() hs.eventtap.keyStroke({'cmd','alt','ctrl'}, key) end)
end
k:bind({'shift'}, 'tab', nil, function() hs.eventtap.keyStroke({'cmd','alt','ctrl','shift'}, 'tab') end)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
