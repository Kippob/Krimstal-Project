local GroupEncounter, super = Class(Encounter)

function GroupEncounter:init()
    super.init(self)

    self.groups = {} -- Storage for all the groups in the fight.
    self.current_group = 0 -- What group are we on? (Minus one)
    self.current_group_turn = 0 -- In this group, what turn is it?
	self.group_count = false -- Should the battle display what group you are on when starting a group?
	self.group_title = "Group" -- What should the groups be called?
end

function GroupEncounter:beforeStateChange(old, new)
	super.beforeStateChange(self, old, new)
	if new == "VICTORY" then
		if self:incrementGroup() then
			Game.battle.enemies_index = {}
			for k,v in ipairs(Game.battle.party) do
				v:resetSprite()
			end
			local text = self:summonGroup()
			Game.battle:setState("ACTIONSELECT")
			Game.battle:setEncounterText({text = text})
			Game.battle.battle_ui.current_encounter_text = {text = text}
		end
	end
end

function GroupEncounter:onTurnStart()
    super.onTurnStart(self)
    self:incrementGroupTurn()
end

function GroupEncounter:addGroup(enemies, text)
	-- enemies: A list of enemy ids to be added when the wave starts.
	-- text: A string that the encounter text is set to when the wave starts.
	local group_table = { enemies, text }
	table.insert(self.groups, group_table)
end

function GroupEncounter:incrementGroup(amt)
	self.current_group = self.current_group + (amt or 1)
    self.current_group_turn = 1
	return self.current_group <= #self.groups
end

function GroupEncounter:setGroup(index)
    self.current_group = index
    self.current_group_turn = 1
	return self.current_group <= #self.groups
end

function GroupEncounter:summonGroup()
	local group_table = self.groups[self.current_group]
	local enemies = group_table[1]
	local added = { }
	local start_x, start_y = 540 - (10 * #enemies), 155 - (45 * #enemies)
	if #enemies == 1 then
		start_x, start_y = 530, 110
	elseif #enemies == 2 then
		start_x, start_y = 520, 65
	elseif #enemies == 3 then
		start_x, start_y = 510, 20
	end
	for k,v in ipairs(enemies) do
		if type(v) == "string" then
			local enemy_x, enemy_y = start_x + (20 * k), start_y + (90 * k)
			local enemy = self:addEnemy(v, SCREEN_WIDTH + 200, enemy_y)
			Game.battle.timer:tween(1, enemy, {x = enemy_x})
		elseif type(v) == "table" then
			local enemy_x = v[2] or start_x + (20 * k)
			local enemy_y = v[3] or start_y + (90 * k)
			local enemy = self:addEnemy(v[1], SCREEN_WIDTH + 200, enemy_y)
			Game.battle.timer:tween(1, enemy, {x = enemy_x})
		end
	end
	if self.group_count == false then
		return group_table[2]
	else
		return "" .. group_table[2] .. " (" .. self.group_title .. " " .. self.current_group + 1 .. "/" .. #self.groups + 1 .. ")"
	end
end

function GroupEncounter:incrementGroupTurn(amt)
    self.current_group_turn = self.current_group_turn + (amt or 1)
end

function GroupEncounter:setGroupTurn(index)
    self.current_group_turn = index
end

return GroupEncounter