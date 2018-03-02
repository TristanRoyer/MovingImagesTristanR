-- Title: MovingImages
-- Name: Tristan Royer
-- Course: ICS2O/3C
-- This program displays a beetleship moving across the screen as well as another 
--object moving in a different direction.

--Testing
print ("***Testing bettleship!")

-- hide the status bar
display.setStatusBar(display.hiddenStatusBar)

-- global variables
scrollSpeed = 3 

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png",2048,1536)

--character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 100)

-- 2nd character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 100)

--set rocketship to be opaque
rocketship.alpha = 1

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = 50

--set the initial x and y position of rocketship
rocketship.x = 400
rocketship.y = 300

--change the direction where the rocketship is facing
rocketship:scale (-1, 1) 

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll sp-eed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed

	-- change the transparency of the ship every time it moves so that it fades 
	-- out
	beetleship.alpha = beetleship.alpha + 0.01

	-- add the scroll speed to the x-value of the Rocketship
    rocketship.x = rocketship.x - scrollSpeed/2

    -- change the transparency of the Rocketship every time it moves so that it fades
    --out
    rocketship.alpha = rocketship.alpha - 0.001
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)



