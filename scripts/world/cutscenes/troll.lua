return {
    mover = function(cutscene, event)
    
    cutscene:text("* PFFFFFT!")
    cutscene:text("* WHAT?!")
    cutscene:text("* You ACTUALLY fell for it?!")
    cutscene:text("* Sometimes I forget how STUPID you are!")
    cutscene:text("* Now you gotta do it alllllllll over again!")
    cutscene:text("* Heh, and that's not even possible!")
    cutscene:text("* ...")
    cutscene:text("* Fine...")
    cutscene:text("* I can put you out of your misery right here and now if you want.")
    cutscene:text("* What do you say?")
    
     local option = cutscene:choicer({"Please don't...", "Fine..."})
    if option == 1 then
        cutscene:text("* Oh... really?")
        cutscene:text("* I mean, It's quite literally NOT possible")
        cutscene:text("* (Sigh) If you insist...")

       Game:setFlag("mover_troll", true)
        
    elseif option == 2 then
        
        cutscene:text("* It would be my pleasure!")
        cutscene:text("* BYE BYE!")
        Game.world:hurtParty(500)

    

 end
end
}

