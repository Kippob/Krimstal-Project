Group Encounters by AcousticJamm

Group encounters are where multiple groups of enemies will attack you one by one. You may know this concept as "wave battles".
Group encounters are easy to make. Just follow these steps:

1) Create an encounter, but instead of overriding Encounter, override GroupEncounter.

2) Set up your Encounter:init() function. This will be the same, with a few exceptions:
   - self.group_count: A boolean value which, if true, shows the wave count in the current battle.
   - self.group_title: If self.group_count is true, it will change "Group" to whatever this value is.
   - self:addGroup({}, ""): Adds a group to the battle. Note that the first group should be set up like a regular Encounter.
      - The first parameter is a table of enemies to add to the group. The enemy can either be a string of an ID or a table representing the information of self:sddEnemy().
      - The second parameter is a string that is set as the battle text when the wave arrives.

The functions provided are as follows:

GroupEncounter:addGroup(enemies, text): Described above.
GroupEncounter:incrementGroup(amt): Increments the group index by 1 or amt.
GroupEncounter:setGroup(index): Sets group index to index.
GroupEncounter:summonGroup(): Summons the group with the current group index.
GroupEncounter:incrementGroupTurn(amt): Increments the group turn by 1 or amt.
GroupEncounter:setGroupTurn(index): Sets group turn to index.
