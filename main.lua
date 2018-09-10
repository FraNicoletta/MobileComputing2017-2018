display.setStatusBar(display.HiddenStatusBar);

-- requires --

local physics = require "physics"
physics.start()

-- background --

local background = display.newImage("Immagini/Sfondo-fisso.png")

local mountain = display.newImage("Immagini/mountain.png")
mountain:setReferencePoint(display.BottomLeftReferencePoint)
mountain.x = 0
mountain.y = 320
mountain.speed = 2
    

local mountain1 = display.newImage("Immagini/mountain.png")
mountain1:setReferencePoint(display.BottomLeftReferencePoint)
mountain1.x = 480
mountain1.y = 320
mountain1.speed = 2
   
    


function scrollSky(self, event)
    if self.x < -477 then
        self.x = 480
    else
        self.x = self.x - self.speed
    end
end

mountain.enterFrame = scrollSky
Runtime:addEventListener("enterFrame", mountain)

mountain1.enterFrame = scrollSky
Runtime:addEventListener("enterFrame", mountain1)

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