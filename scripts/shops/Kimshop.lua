---@class KimShop : Shop
local KimShop, super = Class(Shop, "complete_shop")

function KimShop:init()
    super.init(self)
    
    --Set Up
    self.shop_music = "shop_3"

    --Items
    self:registerItem("top_cake", {description = "Shhh... Don't \ntell him \nI have this...", stock = 1})
    self:registerItem("javacookie", {description = "Worst coding \nlanguage! \n\n[healing = 90] ", stock = 30})
    self:registerItem("greentea", {description = "Green gave me \nthis... I didn't \nwant to waste \nit so... \nhere!", price = 5, stock = 1})
    self:registerItem("butjuice", {price = 69, description = "Oh don't act \nlike you \nwouldn't \ngiggle too!", stock = 15})


    --Shop Dialogue
    self.encounter_text = "* WH-[wait:5] KIP![wait:5] Customer! \n*(WAT?!)"
    self.shop_text = "* Just tell me when you see something!"
    self.leaving_text = "* Come again![wait:5] Please![wait:5] \n*(By by Krisy!)"
    self.buy_menu_text = "Feast your eyes on my goods!"
    self.buy_confirmation_text = "That'll be... \n%s!"
    self.buy_refuse_text = "Oh-[wait:5] okay!"
    self.buy_text = "Wh-[wait:5] thank you so so much,[wait:5] tha'am!"
    self.buy_storage_text = "Not enough space![wait:5] Kris what the hell do you keep in your pockets???"
    self.buy_too_expensive_text = "Hehe...[wait:5] broke little bitch"
    self.sell_no_price_text = "I...[wait:5] physically can't buy this,[wait:5] bud."
    self.sell_menu_text = "Ah yes,[wait:5] time to go into debt!"
    self.sell_nothing_text = "You trying to sell me air?"
    self.sell_refuse_text = "...aw but that was cool..."
    self.sell_text = "I love making poor financial decisions!"
    self.sell_no_storage_text = "...I don't accept air."
    self.sell_everything_text = "Welp.[wait:5] That's it.[wait:5] I can chat if you want!"
    self.talk_text = "Vent all you want,[wait:5] bud."
    self.sell_options_text.items = "Got any dru- I mean healing items?"
    self.sell_options_text.weapons = "Ugh,[wait:5] Kris![wait:5] Without play the knife grows dull!"
    self.sell_options_text.armors = "Got armor for your good ol' pal?"
    self.sell_options_text.storage = "Storage... It's so cool..."


    --Talk Menu
    self:registerTalk("About you")
    self:registerTalk("Friends")
    self:registerTalk("Family")
    self:registerTalk("Mask")

   function KimShop:startTalk(dialogue)
    if dialogue == "About you" then
        self:startDialogue({
            "[emote:talk]* Oh,[wait:5] moi?",
            "[emote:talk]* Well,[wait:5] I don't really know what to talk about...[wait:5] but I guess I can humor you!",
            "[emote:talk]* I'm Kim Omatic,[wait:5] they/them,[wait:5] star sign gemini,[wait:5] blood type F, parent of Kip and ",
        })
    elseif dialogue == "Friends" then
        self:startDialogue({
            "* You are in the test rooms.",
            "[emote:idle]* A place made to test the functions of this world."
        }, function ()
            self.shopkeeper:setSprite("talk")
        end)
        
    elseif dialogue == "Family" then
        self:startDialogue({
            "* You are in the test rooms.",
            "[emote:idle]* A place made to test the functions of this world."
        }, function ()
            self.shopkeeper:setSprite("talk")
        end)

    elseif dialogue == "Mask" then
        self:startDialogue({
            "[emote:impatient]* That's not something I want to talk about.",
        }, function ()
            self.shopkeeper:setSprite("talk")
        end)
    end
end
end

return KimShop