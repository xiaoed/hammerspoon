local launch_or_focus_window = function(name)
	return function()
		local app = hs.appfinder.appFromName(name)
	    if app:isHidden() then
	        hs.application.launchOrFocusByBundleID(app:bundleID())
	        return
	    else
	    	app:hide()
	    end
	end
end

hs.hotkey.bind({"cmd"}, "L", hs.caffeinate.systemSleep)

hs.fnutils.each({
    {key = "C", app = "Google Chrome"},
    {key = "E", app = "YoudaoDict"},
    {key = "F", app = "Finder"},
    {key = "I", app = "IntelliJ IDEA"},
    {key = "L", app = "Sublime Text"},
    {key = "Q", app = "WeChat Work"},
    {key = "S", app = "Sequel Pro"},
    {key = "T", app = "iTerm2"},
    {key = "W", app = "WeChat"}
}, function(meta)
    hs.hotkey.bind("alt", meta.key, launch_or_focus_window(meta.app))
end)