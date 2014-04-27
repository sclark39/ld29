require "src.game.Balance"
require "src.engine.Utility"

-- Engine Systems
require "src.engine.Splashes"
require "src.engine.SceneManager"

-- Scenes
require "src.scenes.TitleScene"
require "src.scenes.IntroScene"
require "src.scenes.GameScene"

--[[
MOAIDebugLines.setStyle ( MOAIDebugLines.TEXT_BOX, 1, 1, 1, 1, 1 )
MOAIDebugLines.setStyle ( MOAIDebugLines.TEXT_BOX_LAYOUT, 1, 0, 0, 1, 1 )
MOAIDebugLines.setStyle ( MOAIDebugLines.TEXT_BOX_BASELINES, 1, 1, 0, 0, 1 )
--]]

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
		Splashes.Run()
		SceneManager.Init();
		SceneManager.Swap( TitleScene );		
	end
);