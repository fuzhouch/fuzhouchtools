require('vis')
require('vis-golang/init')

vis.events.subscribe(vis.events.WIN_OPEN, function(file, path)
    vis:command("set number")
    return true
end)
