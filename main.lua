-- Title: WhackAMole
-- Name: Joelle Ishimwe
-- Course: ICS2O
-- This program displays a random object on the screen. If the user clicks on it in time,
-- the score increases by 1.
-----------------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-----------------------------------------------------------------------------------------------

-- change the backround colour
display.setDefault ("background", 40/255, 90/255, 199/255)

-----------------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------------

-- insert whach sound channel
local whackSound = audio.loadSound("Sounds/whack.mp3")
local whackSoundChannel

-- insert background music
local backgroundMusic = audio.loadSound ("Sounds/background.mp3")
local backgroundMusicChannel

-- call background music 
backgroundMusicChannel = audio.play(backgroundMusic, {loops = -1 })


-----------------------------------------------------------------------------------------------
-- THE MOLE
-----------------------------------------------------------------------------------------------

-- create the mole image
local mole = display.newImage ("Images/mole.png", 0, 0)

	-- scale down the size of the mole
	mole:scale (0.35, 0.35)

	-- make the mole visible
	mole.isVisible = true

-----------------------------------------------------------------------------------------------
-- THE SCORE
-----------------------------------------------------------------------------------------------

-- score
local molesWhacked = 0

-- score text
local score = display.newText ( " Score: " .. molesWhacked, 0, 0, Arial, 60 )

	-- Text Position 
	score.x = display.contentWidth/9
	score.y = 700

	-- changing colour of score
	score:setFillColor( 1, 1, 1 )

-----------------------------------------------------------------------------------------------
-- FUNCTIONS 
-----------------------------------------------------------------------------------------------

--This function that makes the mole appear in a random (x, y) position on the screen
-- before calling the Hide function
function PopUp( )

	-- code that randomly generate the code for the (x, y) position
	mole.x = math.random (0, 768)
	mole.y = math.random (0, 1024)

	-- make the mole visible
	mole.isVisible = true

	-- after 400 milliseconds, call the Hide function
	timer.performWithDelay( 600, Hide )

end


-- This function calls the PopUp function after 2 seconds
function PopUpDelay( )

	-- call the PopUp function after 2 seconds
	timer.performWithDelay(1000, PopUp)

end


-- This function makes the mole invisible and then calls the PopUpDelay function
function Hide ( )

	-- make the mole invisible
	mole.isVisible = false

	-- call PopUpDelay function
	PopUpDelay()

end


-- This fubntion increments the score only if the mole is clicked. It then displays the 
-- new score.
local function Whacked( event )

	-- if touch phase just started
	if (event.phase == "began") then

		-- insert the code to play whacked sound
		whackSoundChannel = audio.play(whackSound)

		-- insert code for the number of moles whacked + 1
		molesWhacked = molesWhacked + 1

		-- display the updated score
		score.text = " Score: ".. molesWhacked	
	end
end


-- This function starts the game 
local function GameStart( )
	PopUpDelay()
end

-----------------------------------------------------------------------------------------------
-- EVENT LISTENERS 
-----------------------------------------------------------------------------------------------

-- If the mole is touched, the Whached function is called
mole:addEventListener( "touch", Whacked)

-----------------------------------------------------------------------------------------------
-- START THE GAME
----------------------------------------------------------------------------------------------

-- call the fuunction that starts the game
GameStart()





