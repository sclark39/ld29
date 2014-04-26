Splashes = 
{
	files = 
	{
		"gfx/splash_ld29.png",
		"gfx/splash_moai.png",
	};
};


function Splashes.Run( func )

	layer = MOAILayer2D.new()
	layer:setViewport( viewport )
	MOAISim.pushRenderPass( layer )

	for _,file in ipairs(Splashes.files) do
		
		local prop = Utility.NewSingleUseProp( file, screenw, screenh );		
		
		prop:setLoc( 0,0 );
		prop:setColor( 0,0,0,0 )
		
		layer:insertProp( prop );

		MOAICoroutine.blockOnAction( prop:seekColor( 1, 1, 1, 1, 0.25 ) )
		MOAICoroutine.blockOnAction( prop:seekColor( 1, 1, 1, 1, 1.5 ) )
		MOAICoroutine.blockOnAction( prop:seekColor( 0, 0, 0, 0, 0.25 ) )
		
		layer:removeProp( prop );
	end
	
	MOAISim.clearRenderStack()
end