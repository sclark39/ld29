Splashes = 
{
	files = 
	{
		"gfx/splash_ld29.png",
		"gfx/splash_moai.png",
	};
};


function Splashes.RunBefore( func )
	
	local props = {};
	
	for _,file in ipairs(Splashes.files) do
		local gfx, prop;
			
		gfx = MOAIGfxQuad2D.new();
		gfx:setRect( -screenw/2, -screenh/2, screenw/2, screenh/2 );
		gfx:setTexture( file );

		prop = MOAIProp2D.new();
		prop:setDeck( gfx );
		prop:setLoc( 0,0 );
		prop:setColor( 0,0,0,0 )
		
		layer:insertProp( prop );
		
		props[#props + 1] = prop;		
	end
				
	local thread = MOAICoroutine.new();
	thread:run(
		function()
			
			-- Run the splashes
			for i,prop in ipairs(props) do				
				MOAICoroutine.blockOnAction( prop:seekColor( 1, 1, 1, 1, 0.25 ) )
				MOAICoroutine.blockOnAction( prop:seekColor( 1, 1, 1, 1, 1.5 ) )
				MOAICoroutine.blockOnAction( prop:seekColor( 0, 0, 0, 0, 0.25 ) )
				layer:removeProp( prop );
			end
			
			-- Cleanup
			props = nil;
			
			func()
		end	
	);
end