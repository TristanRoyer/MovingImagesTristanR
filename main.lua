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
beetleship.x = 20
beetleship.y = 100

--set the initial x and y position of rocketship
rocketship.x = 400
rocketship.y = 300

--change the direction where the rocketship is facing
rocketship:scale (-1, 1) 

-- changes the direction when it reaches the end of the screen
if  (beetleship.y > -100 ) 
then beetleship.y = beetleship.y + scrollSpeed
rocketship:scale(1,-1)
end

-- changes the direction when it reaches the end of the screen
if  (rocketship.x > 0 )
then rocketship.x = rocketship.x + scrollSpeed
rocketship:scale (1,1)
end

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the y-value of the ship
	beetleship.y = beetleship.y - scrollSpeed

	-- change the transparency of the ship every time it moves so that it fades 
	-- out
	beetleship.alpha = beetleship.alpha + 0.01

	
end

-- Function: MoveShip
-- Input: this functuon accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the y value of the ship
local function MoveRocketShip(event)
	-- add the scroll speed to the x-value of the Rocketship
    rocketship.x = rocketship.x - scrollSpeed/2

    -- change the transparency of the Rocketship every time it moves so that it fades
    --out
    rocketship.alpha = rocketship.alpha - 0.001
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)



