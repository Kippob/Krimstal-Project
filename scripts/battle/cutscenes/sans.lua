return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    sans_battle = function(cutscene, battler, enemy)
     BattleCutscene:text("* uhhh this isn't what I meant")
 end
}