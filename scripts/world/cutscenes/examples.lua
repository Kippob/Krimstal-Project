return {
    spin = function(cutscene, event)      
--walking stuff
cutscene:detachFollowers()
cutscene:walkTo("kris", "room_center", 1, "up")
cutscene:walkTo("susie", 280, 200, 1, "up")
cutscene:wait(cutscene:walkTo("ralsei", 360.0, 200, 1, "up"))

--dialouge
 cutscene:setAnimation("aqua", "wave")
 cutscene:text("[image:aquaf, 0, 0, 2, 2] Uuuuu![wait:5] Friends![wait:5] Hiiii!!!!")
 cutscene:text("* Aqua was so excited,[wait:5] she started spinning rapidly")
 cutscene:setAnimation("aqua", "spin")
 cutscene:text("[voice:ralsei][face:ralsei/blush_smile, -15, -10]* Oh![wait:5] Hi Aqua!")
 cutscene:text("[voice:ralsei][face:ralsei/dismissive, -15, -10]* How are you uh...[wait:5] Here?[wait:5] \nYou're a flower???")
 cutscene:text("[image:aquaf, 0, 0, 2, 2] Uuuuu! I made a new friend that helped!!")
 cutscene:text("[voice:ralsei][face:ralsei/neutral, -15, -10]* Oh? New friend?")
 cutscene:setAnimation("aqua", "laugh")
 cutscene:text("[image:aquaf, 0, 0, 2, 2] Uuuuu![wait:5] Here,[wait:5] you can meet them! ")
 cutscene:setSprite("aqua", "idle_left")
 --convoluted way to turn the party lmao
 cutscene:walkTo("susie", 280, 200, 0.1, "left")
 cutscene:walkTo("ralsei", 360.0, 200, 0.1, "left")
 cutscene:walkTo("kris", "room_center", 0.1, "left")
 --sans walk in
 Game.world.music:pause()
 cutscene:walkTo("sans", 280, 120, 6, "right")
 cutscene:wait(1, cutscene:walkTo("aqua", 360, 120, 1, "up"))
 cutscene:walkTo("susie", 280, 200, 0.1, "up")
 cutscene:walkTo("ralsei", 360.0, 200, 0.1, "up")
 cutscene:walkTo("kris", "room_center", 0.1, "up")
 cutscene:wait(6, cutscene:walkTo("sans", 280, 120, 5, "down"))
 cutscene:text("[voice:sans][face:sans/wink]* heya.")
 cutscene:text("[image:aquaf, 0, 0, 2, 2] Friend![wait:5] Meet my other friends!")
 Game.world.music:play("sansaqua")

 --g o n k
 cutscene:setSprite("susie", "gonk")
 cutscene:setSprite("ralsei", "gonk")
 cutscene:text("[voice:susie][face:susie/gonk][image:rals_gonk, 270, 45, 2, 2]* ...")
 cutscene:resetSprite("susie")
 cutscene:resetSprite("ralsei")
 cutscene:text("* Upon seeing Sans,[wait:5] years of muscle memory suddenly came back.")
 cutscene:text("[voice:susie][face:susie/teeth_b]* WHY THE HELL ARE YOU \nHERE?!?!")
 cutscene:text("[voice:sans][face:sans/look_left]* hey hey,[wait:5] i'm just simply looking around,[wait:5] alright?")
 cutscene:text("[voice:sans][face:sans/closed]* shouldn't have had a \ngiant sign saying 'suzys \ncool ass dark world'.")
 cutscene:text("[voice:susie][face:susie/nervous_side]* ...uhhh couldn't have \nbeen me.")
 cutscene:text("[voice:ralsei][face:ralsei/owo, -15, -10]* Susie!")
 cutscene:text("[voice:susie][face:susie/shy_b]* (Kris let's go[wait:5].[wait:5].[wait:5].)")
 cutscene:setAnimation("aqua", "wave")
 cutscene:text("[image:aquaf, 0, 0, 2, 2] Uuuu![wait:5] Bye!!!")

 --leave
 cutscene:setAnimation("aqua", "spin")
 cutscene:alignFollowers()
 cutscene:attachFollowers()
 
    end
}