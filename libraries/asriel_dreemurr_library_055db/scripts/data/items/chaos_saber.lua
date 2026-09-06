local item, super = Class(Item, "chaos_saber")

function item:init()
    super.init(self)

    self.name = "Chaos Saber"
    self.type = "weapon"
    self.icon = "ui/menu/icon/saber"
    self.effect = ""
    self.shop = ""
    self.description = "A magical saber imbued with all\nDark Worlds chaotic energy."
    self.price = 0
    self.can_sell = true
    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false
    self.bonuses = {attack = 0}
    self.bonus_name = nil
    self.bonus_icon = nil
    self.can_equip = {asriel = true}

    -- Character reactions
    self.reactions = {
        asriel = "Heh heh! Good ol' Chaos Saber.",
        susie = "(Damn, if it was an axe...)",
        ralsei = "Oh! Too crazy for me.",
        noelle = "Feels...familiar?",
    }
end

function item:convertToLightEquip(chara)
    return "light/pencil"
end

return item