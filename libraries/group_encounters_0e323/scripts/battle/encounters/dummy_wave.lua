local Dummy, super = Class(GroupEncounter)

function Dummy:init()
    super:init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The tutorial begins...?"
	
	-- Should the group number be displayed at the start of every group after 1?
	self.group_count = true
	
	-- If the group number is displayed, what should the groups be called?
	self.group_title = "Group"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the enemies to the first group of the encounter
	self:addEnemy("dummy")
	self:addEnemy("dummy")
	
	-- Add the groups that will happen when called (usually, after a group is all defeated)
	self:addGroup({ "dummy", "dummy" }, "Ralsei, how many of these things do you have!?")
	
	-- Uncomment this line to add another group!
	-- self:addGroup({ "dummy", "dummy" }, "Ralsei, how many of these things do you have!?")
end

return Dummy