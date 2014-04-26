Scene =
{ 
	onLoad = 
	onUnload
	onUpdate
}


local scenes;
local curScene;

function SceneManager.Init()
	
end

function SceneManager.Update()
	
	while true do
		
		if curScene and type ( curScene.Update ) == "function" then
			curScene.Update()
		end
		
		coroutine.yield();
		
	end
	
end