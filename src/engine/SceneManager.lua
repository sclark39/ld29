local thread;
local curScene;

local function callIfFunc( func, ... )
	if type( func ) == "function" then
		func( ... )
	end
end

function SceneManager.Init()
	thread = MOAICoroutine.new();
	thread:run( SceneManager.Update );
end

function SceneManager.Update()	
	while true do		
		
		if curScene then
			callIfFunc( curScene.onInput );
			callIfFunc( curScene.onUpdate );
		end
		
		coroutine.yield();		
	end
end

function SceneManager.Swap( newScene )
	local oldScene;
	oldScene, curScene = curScene, newScene;
	callIfFunc( oldScene and oldScene.onUnload );
	callIfFunc( newScene and newScene.onUnload );
end