IntroScene = {};

function IntroScene.OnLoad()
	local layer = MOAILayer2D.new()
	layer:setViewport( viewport )
	MOAISim.pushRenderPass( layer )
	
	local bg = Utility.NewSingleUseProp( "gfx/title.png", screenw, screenh );		
	local press_start = Utility.NewSingleUseProp( "gfx/press_start.png", 303, 39 );		
	
	bg:setLoc( 0, 0 );
	press_start:setLoc( 0, -222 );

	layer:insertProp( bg );
	layer:insertProp( press_start );
	
	local curve = MOAIAnimCurve.new();
	curve:reserveKeys( 3 );
	curve:setKey ( 1, 0, 0 )
	curve:setKey ( 2, 0.25, 1 )
	curve:setKey ( 3, 0.5, 0 )
	curve:setWrapMode ( MOAIAnimCurve.WRAP )
	

	--press_start:setAttrLink ( MOAIProp2D.ATTR_Z_ROT, curve, MOAIAnimCurve.ATTR_VALUE )

	anim = MOAIAnim.new();
	anim:reserveLinks( 4 );
	anim:setLink( 1, curve, press_start, MOAIProp2D.ATTR_R_COL );
	anim:setLink( 2, curve, press_start, MOAIProp2D.ATTR_G_COL );
	anim:setLink( 3, curve, press_start, MOAIProp2D.ATTR_B_COL );
	anim:setLink( 4, curve, press_start, MOAIProp2D.ATTR_A_COL );
	anim:setMode( MOAITimer.LOOP );
	anim:start();
end

function IntroScene.OnUnload()
	
	MOAISim.clearRenderStack()
	
end


function IntroScene.OnUpdate()
	
end

