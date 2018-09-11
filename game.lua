-- requires --

local physics = require "physics"
physics.start()

local storyboard = require ("storyboard")
local scene = storyboard.newScene()

-- background --




function scene:createScene(event)

    local screenGroup = self.view

    local background = display.newImage("Immagini/Sfondo-fisso.png")
    screenGroup:insert(background)


    mountain = display.newImage("Immagini/mountain.png")
    mountain:setReferencePoint(display.BottomLeftReferencePoint)
    mountain.x = 0
    mountain.y = 320
    mountain.speed = 2
    screenGroup:insert(mountain)

    

    mountain1 = display.newImage("Immagini/mountain.png")
    mountain1:setReferencePoint(display.BottomLeftReferencePoint)
    mountain1.x = 480
    mountain1.y = 320
    mountain1.speed = 2
    screenGroup:insert(mountain1)


    balloon = display.newImage("Immagini/palloncino.png")
    balloon.x = 100
    balloon.y = 100
    physics.addBody(balloon, "dinamic", {density=.1, bounce=0.1, friction=.2, radius=12})
    screenGroup:insert(balloon)

    pig = display.newImage("Immagini/pig.png")
    pig.x = 500
    pig.y = 100
    pig.speed = math.random(2,6)
    physics.addBody(pig, "static", {density=.1, bounce=0.1, friction=.2, radius=12})
    screenGroup:insert(pig)


end

function scrollSky(self, event)
    if self.x < -477 then
        self.x = 480
    else
        self.x = self.x - self.speed
    end
end

function movePigs(self, event)
    if self.x < -50 then
        self.x = 500
    else
        self.x = self.x - self.speed
    end
end

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



function scene:enterScene(event)

    Runtime:addEventListener("touch", touchScreen)

    mountain.enterFrame = scrollSky
    Runtime:addEventListener("enterFrame", mountain)

    mountain1.enterFrame = scrollSky
    Runtime:addEventListener("enterFrame", mountain1)

    pig.enterFrame = movePigs
    Runtime:addEventListener("enterFrame", pig)
end

function scene:exitScene(event)

end

function scene:destroyScene(event)

end


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
