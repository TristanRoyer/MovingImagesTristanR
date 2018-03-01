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
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.X = 0
beetleship.Y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll sp-eed to the x-value of the ship
local function MoveShip(event)
	-- add tge scroll speed to the x-value of the ship
	beetleship.X = beetleship.X + scrollSpeed
	-- change the transparency of the ship every time it moves so that is fades 
	-- out
	beetleship.alpha = beetleship.alpha + 0.01
end

--MoveSbip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

