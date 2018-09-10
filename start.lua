-- requires 


local storyboard = require ("storyboard")
local scene = storyboard.newScene()

-- background

function scene:createScene(event)

	local screenGroup = self.view

	background = display.newImage("Immagini/start.png")

    mountain = display.newImage("Immagini/mountain.png")
    mountain:setReferencePoint(display.BottomLeftReferencePoint)
    mountain.x = 0
    mountain.y = 320
    

end


function start(event)
	if event.phase == "began" then
		storyboard.gotoScene("game", "fade", 400)
	end
end


function scene:enterScene(event)

	background:addEventListener("touch", start)

end

function scene:exitScene(event)
	background:removeEventListener("touch", start)
end

function scene:destroyScene(event)

end


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
