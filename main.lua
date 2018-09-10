display.setStatusBar(display.HiddenStatusBar);

-- requires --

local physics = require "physics"
physics.start()

-- background --

local background1 = display.newImage("Immagini/sfondo.png")
background1:setReferencePoint(display.BottomLeftReferencePoint)
background1.x = 0
background1.y = 320
background1.speed = 2
    

background2 = display.newImage("Immagini/sfondo.png")
background2:setReferencePoint(display.BottomLeftReferencePoint)
background2.x = 480
background2.y = 320
background2.speed = 2
   
    


function scrollSky(self, event)
    if self.x < -477 then
        self.x = 480
    else
        self.x = self.x - self.speed
    end
end

background1.enterFrame = scrollSky
Runtime:addEventListener("enterFrame", background1)

background2.enterFrame = scrollSky
Runtime:addEventListener("enterFrame", background2)

-- balloon --

local balloon = display.newImage("Immagini/palloncino.png")
balloon.x = 100
balloon.y = 100
physics.addBody(balloon, "dinamic", {density=.1, bounce=0.1, friction=.2, radius=12})

function blowBalloon(self, event)
    self:applyForce(0, -1.5, self.x, self.y)
end

function touchScreen(event)
    if event.phase == "began" then
        balloon.enterFrame = blowBalloon
        Runtime:addEventListener("enterFrame", balloon)
    end

    if event.phase == "ended" then
        Runtime:removeEventListener("enterFrame", balloon)
    end
end

Runtime:addEventListener("touch", touchScreen)