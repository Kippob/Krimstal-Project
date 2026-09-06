---@class reset_climb : Event
local reset_climb, super = Class(Event)

function reset_climb:init(x, y, shape)
    super.init(self, x, y, shape)
end

function reset_climb:onInteract(player, dir)
    Game.world.map:loadObjects("objects")
    return true
end

return reset_climb
