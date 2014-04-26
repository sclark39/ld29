require "src.engine.Utility"

-- Engine Systems
require "src.engine.Splashes"
require "src.engine.SceneManager"

-- Scenes
require "src.scenes.IntroScene"

-- Initialize the window
screenw,screenh = 1024,800

MOAISim.openWindow( "Illuminati: Political Action Committee", screenw, screenh )

local clearColor = MOAIColor.new()
clearColor:setColor( 0,0,0, 1 )
MOAIGfxDevice.setClearColor(clearColor)

viewport = MOAIViewport.new()
viewport:setScale( screenw, screenh )
viewport:setSize( screenw, screenh )


mainThread = MOAICoroutine.new();
mainThread:run( 
	function()
		--Splashes.Run()
		SceneManager.Init();
		SceneManager.Swap( IntroScene );		
	end
);