--  ___  _      _        _                          _       
-- | _ \(_) __ | |__ ___| |_   __ _  _ __ __  __ _ | | __ _ 
-- |   /| |/ _|| / /(_-/|   \ / _` | \ V  V // _` || |/ _` |
-- |_|_\|_|\__||_\_\/__/|_||_|\__/_|  \_/\_/ \__/_||_|\__/_|
 
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local logout_popup = require("awesome-wm-widgets.logout-popup-widget.logout-popup")

--https://awesomewm.org/doc/api/documentation/05-awesomerc.md.html
-- Standard awesome library
local gears         = require("gears") --Utilities such as color parsing and objects
local awful         = require("awful") --Everything related to window managment
                      require("awful.autofocus")
-- Widget and layout library
local wibox         = require("wibox")

-- Theme handling library
local beautiful     = require("beautiful")

-- Notification library
--local naughty       = require("naughty")
--naughty.config.defaults['icon_size'] = 130

--local menubar       = require("menubar")

local lain          = require("lain")
local freedesktop   = require("freedesktop")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi
-- }}}
-- for moving the windows around in float mode, I havent found a better solution yet




---- {{{ Error handling
---- Check if awesome encountered an error during startup and fell back to
---- another config (This code will only ever execute for the fallback config)
--if awesome.startup_errors then
--    naughty.notify({ preset = naughty.config.presets.critical,
--                     title = "Sadly, an error happened during startup!!! notify this to the rice creator plsss",
--                     text = awesome.startup_errors })
--end
--
---- Handle runtime errors after startup
--do
--    local in_error = false
--    awesome.connect_signal("debug::error", function (err)
--        if in_error then return end
--        in_error = true
--
--        naughty.notify({ preset = naughty.config.presets.critical,
--                         title = "Sadly, an error happened!! notify this to the rice creator plsss",
--                         text = tostring(err) })
--        in_error = false
--    end)
--end
---- }}}
--

--Notifications with dunst over naughty
-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
   local in_error = false
   awesome.connect_signal("debug::error", function (err)
        -- Make sure we dont go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}


-- {{{ Autostart windowless processes
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "unclutter -root" }) -- entries must be comma-separated
-- }}}

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

-- }}}

-- {{{ Variable definitions

local themes = {
    "hybrid-some",      -- 1
    "nordish",          -- 2
    "cyberpunk",        -- 3
}

-- choose your theme here
local chosen_theme = themes[2]

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
beautiful.init(theme_path)

-- modkey or mod4 = super key
local modkey       = "Mod4"
local altkey       = "Mod1"
local modkey1      = "Control"

-- personal variables
--change these variables if you want
local browser3          = "vialdi-stable"
local editor            = os.getenv("EDITOR") or "vim"
local editorgui         = "emacsclient -ce -a kate"
local filemanager       = "pcmanfm"
local mailclient        = "thunderbird"
local mediaplayer       = "spotify"
local terminal          = "alacritty"
local virtualmachine    = "virtualbox"

-- awesome variables
awful.util.terminal = terminal
-- Use this : https://fontawesome.com/cheatsheet
awful.util.tagnames = { "games", "doscord", "browser", "terminal", "spotify", "क", "ख", "ग", "घ" } --doscord is an personal reference, just uncomment another line or rename these ones
--awful.util.tagnames = {  "", "", "", "", ""}
--awful.util.tagnames = { "⠐", "⠡", "⠲", "⠵", "⠻", "⠿" }
--awful.util.tagnames = { "⌘", "♐", "⌥", "ℵ" }
--awful.util.tagnames = { "", "", "", "", "" }

awful.layout.suit.tile.left.mirror = true
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)


-- If youre going to use a tasklist, uncomment all of these lines!

--awful.util.tasklist_buttons = my_table.join(
--    awful.button({ }, 1, function (c)
--        if c == client.focus then
--            c.minimized = true
--        else
--            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>
--
--            -- Without this, the following
--            -- :isvisible() makes no sense
--            c.minimized = false
--            if not c:isvisible() and c.first_tag then
--                c.first_tag:view_only()
--            end
--            -- This will also un-minimize
--            -- the client, if needed
--            client.focus = c
--            c:raise()
--        end
--    end),
--
--    awful.button({ }, 3, function ()
--        local instance = nil
--
--        return function ()
--            if instance and instance.wibox.visible then
--                instance:hide()
--                instance = nil
--            else
--                instance = awful.menu.clients({theme = {width = dpi(250)}})
--            end
--        end
--    end),
--    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
--    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
--)

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- }}}



-- {{{ Menu
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "arandr", "arandr" },
}

awful.util.mymainmenu = freedesktop.menu.build({
    before = {
        { "Awesome", myawesomemenu },
        --{ "Atom", "atom" },
        -- other triads can be put here
    },
    after = {
        { "Terminal", terminal },
        { "Browser", browser3 },
        { "Log out", function() awesome.quit() end },
        { "Sleep", "systemctl suspend" },
        { "Restart", "systemctl reboot" },
        { "Shutdown", "systemctl poweroff" },
        -- other triads can be put here
    }
})
-- hide menu when mouse leaves it
--awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)

--menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it
-- }}}



--{{{ Screen
--Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s)
    s.systray = wibox.widget.systray()
    s.systray.visible = true
end)

-- {{{ Mouse bindings
root.buttons(my_table.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = my_table.join(

    --SYSTEM
    -- Things will come soon

    -- browser
    awful.key({ modkey }, "q", function () awful.util.spawn( "firefox" ) end,
        {description = "browser", group = "apps"}),

    -- emacs
    awful.key({ modkey }, "z", function () awful.util.spawn( "emacsclient -ce -a emacs" ) end,
        {description = "emacs", group = "apps"}),

    -- feh background change
    awful.key({ modkey }, "y", function () awful.util.spawn( "feh --bg-fill --randomize /home/ykperson/Pictures/wallpapers/" ) end,
        {description = "background change", group = "apps"}),

    -- xkill
    awful.key({ modkey, "Shift" }, "c", function () awful.util.spawn( "xkill" ) end,
        {description = "xkill", group = "apps"}),

    -- Definitions
    awful.key({ modkey, }, "`", function () awful.util.spawn( "sh /home/ykperson/Documents/linuxe/sh/word-lookup.sh" ) end,
        {description = "define", group = "apps"}),

    -- spotify
    awful.key({ modkey }, "r", function () awful.util.spawn( "flatpak run com.spotify.client" ) end,
        {description = "spotify", group = "apps"}),

    -- minecraft
    awful.key({ modkey }, "t", function () awful.util.spawn( "flatpak run com.mojang.Minecraft" ) end,
        {description = "minecraft", group = "apps"}),

    -- flameshot
    awful.key({ }, "Print", function () awful.util.spawn( "flameshot gui" ) end,
        {description = "flameshot- screenshot utility" , group = "apps"}),

    -- Discord
    awful.key({ modkey }, "d", function () awful.util.spawn( "flatpak run com.discordapp.Discord" ) end,
        {description = "discord", group = "apps"}),
    
    -- Rofi / run a program
    awful.key({ modkey, "Shift" }, "space", function () awful.util.spawn( "rofi -show drun" ) end,
        {description = "Run program", group = "hotkeys"}),

    -- Rofi / Everything
    awful.key({ modkey }, "space", function () awful.util.spawn( "rofi -show combi" ) end,
        {description = "Run Everything", group = "hotkeys"}),
 
    -- Rofi- alt tab
    awful.key({ modkey, "Shift" }, "Tab", function () awful.util.spawn( "rofi -show window" ) end,
        {description = "Switch Windows", group = "hotkeys"}),

     -- Rofi- current tag alt tab
    awful.key({ modkey}, "Tab", function () awful.util.spawn( "rofi -show windowcd" ) end,
        {description = "Switch Windows in tag", group = "hotkeys"}),
  
    -- FM
    awful.key({ modkey, "Shift" }, "e", function () awful.util.spawn( "flatpak run org.kde.dolphin" ) end,
        {description = "FM", group = "apps"}),
   
    -- FM- rofi
    awful.key({ modkey }, "e", function () awful.util.spawn( "rofi -show filebrowser" ) end,
        {description = "FM -rofi", group = "apps"}),

    -- Libre Office
    awful.key({ modkey }, "g", function () awful.util.spawn( "libreoffice" ) end,
        {description = "Office", group = "apps"}),

    -- Scratchpad Alacritty
     awful.key({ modkey, "Shift" }, "Return", function () awful.util.spawn( "tdrop -am -x 50% -y 50 -w 1341 -h 980 kitty" ) end,
 	{description = "Scratchpad Alacritty", group = "scratchpad"}),

    -- Thunderbird scratchpad
     awful.key({ modkey }, "w", function () awful.util.spawn( "tdrop -am -x 15% -y 50 -w 1341 -h 980 thunderbird" ) end,
        {description = "Scratchpad Thunderbird", group = "scratchpad"}),

    -- Pavucontrol scratchpad
    awful.key({ modkey }, "v", function () awful.util.spawn( "tdrop -am -x 15% -y 50 -w 1341 -h 800 pavucontrol" ) end,
        {description = "Scratchpad pulseaudio control", group = "scratchpad"}),

    -- Hotkeys Awesome
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
        {description = "show help", group="awesome"}),

    -- exit dialog
    awful.key({ modkey }, "x",  function () logout_popup.launch() end,
      {description = "exit", group = "hotkeys"}),

    
    -- Non-empty tag browsing
    awful.key({ modkey, "Shift" }, "Left", function () lain.util.tag_view_nonempty(-1) end,
      {description = "view  previous nonempty", group = "tag"}),
    awful.key({ modkey, "Shift" }, "Right", function () lain.util.tag_view_nonempty(1) end,
      {description = "view  next nonempty", group = "tag"}),
    
    -- Empty Tag Browsing
    awful.key({ modkey }, "Left", function () awful.tag.viewprev() end,
      {description = "view  previous empty", group = "tag"}),
    awful.key({ modkey }, "Right", function () awful.tag.viewnext() end,
      {description = "view  next empty", group = "tag"}),


    -- Default client focus
    awful.key({ modkey }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

       -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "client"}),

    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "client"}),
	      
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),


    --Asus Specific

    awful.key({ }, "XF86KbdBrightnessDown", function () awful.util.spawn( "asusctl -p" ) end,
              {description = BrightnessDown , group = "utilities"}),

    awful.key({ }, "XF86KbdBrightnessUp", function () awful.util.spawn( "asusctl -n" ) end,
              {description = BrightnessUp , group = "utilities"}),

    awful.key({ }, "XF86Launch1", function () awful.util.spawn( "keepassxc" ) end,
              {description = terminal , group = "utilities"}),

    awful.key({ }, "XF86Launch3", function () awful.util.spawn( "asusctl led-mode -n" ) end,
              {description = NextColour , group = "utilities"}),

    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "Toggle bar visibility", group = "awesome"}),

 -- Show/Hide Systray
    awful.key({ modkey }, "-", function ()
    awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
    end, {description = "Toggle systray visibility", group = "awesome"}),

    -- Standard program
    awful.key({ modkey,}, "Return", function () awful.spawn(terminal) end,
              {description = terminal , group = "apps"}),

    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey, }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey, altkey }, "Return", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),

    awful.key({ modkey, "Control"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"})
)

clientkeys = my_table.join(
    awful.key({ modkey, "Shift"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),

    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({ modkey, }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "hotkeys"}),

    awful.key({ modkey, "Shift" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),

    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),

    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),

    awful.key({ modkey,           }, "u",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),

    awful.key({ modkey,           }, "i",   function () awful.util.spawn( "kitty -e vim /home/ykperson/.config/awesome/rc.lua" ) end,
              {description = "open the config", group = "hotkeys"}),


    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients cant have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),

    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                              tag:view_only()
                          end
                     end
                  end,
                  descr_move),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end

-- move floating windows by holding mod and mousebuttons
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}



-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = false } },

    },

    -- Titlebars

--if  getname (_layout) 
--    then
--    { rule_any = { type = { "dialog", "normal" } },
--     properties = { titlebars_enabled = true } },
--    else
--     { rule_any = { type = { "dialog", "normal" } },
--      properties = { titlebars_enabled = false } },
--    end

    -- Set applications to be maximized at startup.
    -- find class or role via xprop command
    -- example of how it should look

    --{ rule = { class = "Gimp*", role = "gimp-image-window" },
    --      properties = { maximized = true, floating = false } },

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = dpi(21)}) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

awful.spawn.with_shell("~/.config/awesome/autostart.sh")

--Gaps 
beautiful.useless_gap = 10
