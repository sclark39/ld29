SceneManager = {};

local thread;
local curScene;

local function callIfFunc( func, ... )
	if type( func ) == "function" then
		func( ... );
	end
end

function SceneManager.Init()
	thread = MOAICoroutine.new();
	thread:run( SceneManager.Update );
end

function SceneManager.Update()	
	while true do		
		
		coroutine.yield();	
		
		if curScene then
			callIfFunc( curScene.OnInput );
			callIfFunc( curScene.OnUpdate );
		end
			
	end
end

function SceneManager.Swap( newScene )
	
	local oldScene = curScene;
	curScene = nil; -- Update runs in a different thread, so make sure its deactivated while we do this part
	callIfFunc( oldScene and oldScene.OnUnload );
	callIfFunc( newScene and newScene.OnLoad );
	curScene = newScene;
end