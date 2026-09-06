function Mod:init()
    Game:registerEvent("squeak", function(data)
        return Squeak(data.x, data.y, {data.width, data.height, data.polygon})
    end)
    print("Loaded " .. self.info.name .. "!")
end

function Mod:init()
    Game:registerEvent("reset_climb", function(data)
        return reset_climb(data.x, data.y, {data.width, data.height, data.polygon})
    end)
    print("Loaded " .. self.info.name .. "!")
end

function Mod:init()
Game:registerEvent("climbshooter", function(data)
        -- timer_offset is a custom property! Let's read it here and pass it into our object.
        -- Same with shoot_speed.
        return ClimbShooter(data.x, data.y, { data.width, data.height }, data.properties.timer_offset, data.properties.shoot_speed)
    end)
end