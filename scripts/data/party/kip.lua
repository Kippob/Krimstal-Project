local character, super = Class(PartyMember, "kip")

function character:init()
    super.init(self)
    -- Display name
    self.name = "kip"

    -- Actor (handles overworld/battle sprites)
    self:setActor("kip")
    self:setLightActor("kip")

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)
    self.title = "gay\nCan dodge attacks"

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 1
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {29, 47, 77}

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "K-Action"

    -- Spells
    self:addSpell("heal_prayer")

    -- Current health (saved to the save file)
    self.health = 130

    -- Base stats (saved to the save file)
    self.stats = {
        health = 130,
        attack = 5,
        defense = 1,
        magic = 10
    }

    -- Max stats from level-ups
    self.max_stats = {
        health = 200
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"

    -- Equipment (saved to the save file)
    self:setWeapon("everybodyweapon")
    self:setArmor(1, "amber_card")
    --self:setArmor(2, "amber_card")

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = ""
    self.lw_armor_default = ""

    -- Character color (for action box outline and hp bar)
    self.color = {231, 204, 233}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.5, 0.75, 1}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0, 0.5, 1}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0, 0.25, 1}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {231, 204, 233}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/kip/head"
    -- Path to head icons used in battle
    self.head_icons = "party/kip/icon"
    -- Name sprite
    self.name_sprite = "party/kris/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "damage"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {2, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil
end

return character