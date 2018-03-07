-- Title: MovingImages
-- Name: Tristan Royer
-- Course: ICS2O/3C
-- This program displays a beetleship moving across the screen as well as another 
--object moving in a different direction.

--Testing
print ("***Testing bettleship!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeedBeetleship = 3
scrollSpeedRocketShip = 2


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
beetleship.y = 50
--set the initial x and y position of rocketship
rocketship.x = 400
rocketship.y = 200

--change the direction where the rocketship is facing
rocketship:scale (-1, 1) 


-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the y-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the y-value of the ship
	beetleship.y = beetleship.y + scrollSpeedBeetleship

	-- change the transparency of the ship every time it moves so that it fades 
	-- out
	beetleship.alpha = beetleship.alpha + 0.01


	-- changes the direction when it reaches the end of the screen
	if (beetleship.y > 250) then
  		scrollSpeedBeetleship = -3
 	end

	if (beetleship.y < 85) then
  		scrollSpeedBeetleship = 4	
  	end
 
end

-- Function: MoveRocketShip
-- Input: this functuon accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x value of the ship
local function MoveRocketShip(event)
	-- add the scroll speed to the x-value of the Rocketship
    rocketship.x = rocketship.x - scrollSpeedRocketShip

    -- change the transparency of the Rocketship every time it moves so that it fades
    --out
    rocketship.alpha = rocketship.alpha - 0.001

-- Flips it vertically
rocketship.xScale = rocketship.xScale + 0.01

-- makes the image grow
rocketship.yScale = rocketship.yScale + 0.01
    
    -- changes the direction when it reaches the end of the screen
if (rocketship.x > 1000) then
 scrollSpeedRocketShip = -2
 rocketship.xScale = 2
end

if (rocketship.x < 100) then
	scrollSpeedRocketShip = 2
	rocketship.xScale = 1
end
end
--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--MoveRocketShip will be called over and over again
Runtime:addEventListener("enterFrame",MoveRocketShip)



