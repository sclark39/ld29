GameScene = {};

function GameScene.OnLoad()
	local layer = MOAILayer2D.new()
	layer:setViewport( viewport )
	MOAISim.pushRenderPass( layer )	
end

function GameScene.OnUnload()
	
	MOAISim.clearRenderStack()
	
end


function GameScene.OnUpdate()
	
	
end