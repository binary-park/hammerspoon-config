-- hammerspoon config

local app_mode = hs.hotkey.modal.new()

hs.hotkey.bind({}, 'f17', function() app_mode:enter() end, function() app_mode:exit() end)

hs.hotkey.bind({'command', 'shift'}, 'a', function()
	hs.alert.show('hello world')
end)


do  -- app manager
    local app_man = require('modules.appman')
    local mode = app_mode

    mode:bind({}, 'c', app_man:toggle('Google Chrome'))
    mode:bind({}, 'i', app_man:toggle('IntelliJ IDEA'))
    mode:bind({}, 'p', app_man:toggle('PhpStorm'))
    mode:bind({}, 'v', app_man:toggle('Visual Studio Code'))
    -- mode:bind({}, 'q', app_man:toggle('Sequel Pro'))
    mode:bind({'shift'}, 'n', app_man:toggle('Notes'))
    mode:bind({}, 's', app_man:toggle('Slack'))
    mode:bind({}, 'f', app_man:toggle('Franz'))
    mode:bind({}, 'e', app_man:toggle('Finder'))
    mode:bind({}, 'r', app_man:toggle('Reminders'))
    mode:bind({}, 'a', app_man:toggle('Safari'))
    mode:bind({}, 't', app_man:toggle('Microsoft To Do'))
    -- mode:bind({}, 'b', app_man:toggle('Robo 3T'))
    mode:bind({}, 'k', app_man:toggle('KakaoTalk'))
    mode:bind({}, 'n', app_man:toggle('Notion'))
    mode:bind({}, 'space', app_man:toggle('iTerm'))
    mode:bind({}, 'b', app_man:toggle('Between'))
    mode:bind({}, ',', app_man:toggle('System Preferences'))
    mode:bind({}, 'z', function() hs.eventtap.keyStroke({'command', 'shift'}, 'space') end)
   
    mode:bind({}, 'tab', hs.hints.windowHints)
    hs.hints.hintChars = {
	    'q', 'w', 'e', 'r',
	    'a', 's', 'd', 'f',
	    'z', 'x', 'c', 'v',
	    '1', '2', '3', '4',
	    'j', 'k',
	    'i', 'o',
	    'm', ','
    }
end

do  -- winmove
     local win_move = require('modules.winmove')
     -- local mode = win_mode
     local mode = app_mode
 
     mode:bind({}, '0', win_move.default)
     mode:bind({'shift'}, '0', win_move.move(1/6, 0, 4/6, 1))
     mode:bind({}, '1', win_move.left_bottom)
     mode:bind({}, '2', win_move.bottom)
     mode:bind({}, '3', win_move.right_bottom)
     mode:bind({}, '4', win_move.left)
     mode:bind({'shift'}, '4', win_move.move(0, 0, 2/3, 1))
     mode:bind({}, '5', win_move.full_screen)
     mode:bind({}, '6', win_move.right)
     mode:bind({'shift'}, '6', win_move.move(1/3, 0, 2/3, 1))
     mode:bind({}, '7', win_move.left_top)
     mode:bind({}, '8', win_move.top)
     mode:bind({}, '9', win_move.right_top)
     mode:bind({}, '-', win_move.prev_screen)
     mode:bind({}, '=', win_move.next_screen)
end


hs.alert.show('loaded')

