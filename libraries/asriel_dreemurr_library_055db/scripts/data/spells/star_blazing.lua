local spell, super = Class(Spell, "star_blazing")

function spell:init()
    super.init(self)

    self.name = "Star Blazing"
    self.cast_name = nil
    self.effect = "Summon\nSTAR dmg"
    self.description = "Deals massive STAR-elemental damage to\none foe. Depends on Attack & Magic."
    self.cost = 72
    self.target = "enemy"
    self.tags = {"damage"}
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." cast "..self:getCastName().."!"
end

function spell:onCast(user, target)
    local star_finished = false
    Game.battle.timer:after(0, function()
        Assets.playSound("starfall", 0.6)
        local x, y = user:getRelativePos(user.width/2, user.height-200, Game.battle)
        local tx, ty = target:getRelativePos(target.width/2, target.height/2, Game.battle)
        local blast = StarBeam(false, x, y, tx, ty, function(pressed)
            local damage = self:getDamage(user, target, pressed)
            Assets.playSound("scytheburst", 1.7, 0.9)
            target:flash()
            target:hurt(damage, user)
            star_finished = true
            if star_finished then
                Game.battle:finishAction()
            end
        end)
        blast.layer = BATTLE_LAYERS["above_ui"]
        Game.battle:addChild(blast)
    end)
    return false
end

function spell:getDamage(user, target, pressed)
    local damage = math.ceil((user.chara:getStat("magic") * 9) + (user.chara:getStat("attack") * 13) - (target.defense * 2))
    if pressed then
        damage = damage + math.random(10, 40)
    end
    return damage
end

return spell