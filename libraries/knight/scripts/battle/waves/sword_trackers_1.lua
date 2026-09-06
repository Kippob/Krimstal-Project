local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self.time = 8
end

function Basic:onStart()
    local timer = 1.5

    -- Every 0.33 seconds...
    local function knife()
        if timer > 0.6 then timer = timer - 0.25 end
        self:spawnBullet("sword", timer-0.25)
    end
    Game.battle.timer:script(function (wait)
        knife()
        wait(timer)

        knife()
        wait(timer)

        knife()
        wait(timer)

        knife()
        wait(timer)

        knife()
        wait(timer)

        knife()
        wait(timer)

        knife()
        wait(timer)

        knife()
        wait(timer)

        knife()
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
