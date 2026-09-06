local character, super = Class(PartyMember)

function character:init()
    super.init(self)

    self.name = "Asriel"
    self:setActor("asriel")
    self.level = Game.chapter
    self.title = "Chaos Control\nBinds and controls\nall CHAOS."
    self.soul_priority = 1
    self.soul_color = {1, 0, 0}
    self.has_act = false
    self.has_spells = true
    self.has_xact = true
    self.xact_name = "A-Action"

    if Game.chapter == 1 then
    self.health = 140
    elseif Game.character == 2 then
    self.health = 170
    elseif Game.chapter == 3 then
    self.health = 220
    else
    self.health = 260
    end

    if Game.chapter == 1 then
    self.stats = {
        health = 140,
        attack = 16,
        defense = 2,
        magic = 4
        }
    elseif Game.chapter == 2 then
    self.stats = {
        health = 170,
        attack = 18,
        defense = 2,
        magic = 6
        }
    elseif Game.chapter == 3 then
    self.stats = {
        health = 220,
        attack = 21,
        defense = 2,
        magic = 9
        }
    else
        self.stats = {
        health = 260,
        attack = 23,
        defense = 2,
        magic = 11
        }
    end

    if Game.chapter == 1 then
        self.max_stats = {
            health = 170
        }
    elseif Game.chapter == 2 then
        self.max_stats = {
            health = 220
        }
    elseif Game.chapter == 3 then
        self.max_stats = {
            health = 260
        }
    else
        self.max_stats = {
            health = 310
        }
    end

    self:addSpell("star_blazing")
    self:addSpell("star_fury")
    self:setWeapon("chaos_saber")

    self.weapon_icon = "ui/menu/equip/saber"
    self.color = {1, 1, 1}
    self.dmg_color = {0.85, 0.85, 0.85}
    self.attack_bar_color = {0.85, 0.85, 0.85}
    self.attack_box_color = {1, 1, 1}
    self.xact_color = {0.85, 0.85, 0.85}
    self.menu_icon = "party/asriel/head"
    self.head_icons = "party/asriel/icon"
    self.name_sprite = "party/asriel/name"
    self.attack_sprite = "effects/attack/saber"
    self.attack_sound = "laz_c"
    self.attack_pitch = 0.8
    self.battle_offset = {2, 1}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil
    self.gameover_message = nil
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 2 == 0 then
        self:increaseStat("health", 2)
    end
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/fluff")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Fluff:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        return true
    elseif index == 2 then 
        local icon = Assets.getTexture("ui/menu/icon/demon")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Tough:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        if Game.chapter >= 2 then
            Draw.draw(icon, x+110, y+6, 0, 2, 2)
        end
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        Draw.draw(icon, x+110, y+6, 0, 2, 2)
        if Game.chapter >= 2 then
            Draw.draw(icon, x+130, y+6, 0, 2, 2)
        end
        return true
    end
end

return character