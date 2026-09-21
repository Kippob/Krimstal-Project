local spell, super = Class(Spell, "swap")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Swap"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    if Game.chapter <= 3 then
        self.effect = "Swap\nally"
    else
        self.effect = "Swap\nally"
    end
    -- Menu description
    self.description = "Swaps the Target With an Ally! (WIP)"

    -- TP cost
    self.cost = 6

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"swap"}
end

function spell:onCast(user, target)
    Mod.libs["midbattleparty"]:midbattleparty("kris", nil, nil, nil, true)
end

return spell