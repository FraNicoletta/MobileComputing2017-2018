display.setStatusBar(display.HiddenStatusBar);


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