TitleScene = {};

function TitleScene.OnLoad()
	local layer = MOAILayer2D.new()
	layer:setViewport( viewport )
	MOAISim.pushRenderPass( layer )
	
	local bg = Utility.NewSingleUseProp( "gfx/title.png", screenw, screenh );				
	bg:setLoc( 0, 0 );
	bg:setColor( 0, 0, 0, 0 );
	
	layer:insertProp( bg );
	
	MOAICoroutine.blockOnAction( bg:seekColor( 1, 1, 1, 1, 0.25 ) )
	
	local font = MOAIFont.new ()
	--font:load ( "fnt/OLondon_.otf" )
	font:load( "fnt/JackInput.TTF" )
	local charcodes = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .,:;!?()&/-';
	font:preloadGlyphs ( charcodes, 36 );
 
	local style = MOAITextStyle.new ()
	style:setFont ( font )
	style:setSize ( 36 )
	style:setColor ( 224/255, 199/255, 150/255, 1 )
	
	textbox = MOAITextBox.new();
	textbox:setStyle( style );
	textbox:setString( "Click to Start" );
	
	do
		local w,h,x,y = 500,100,0,-222;
		textbox:setRect ( -w/2 + x, -h/2 + y, w/2 + x, h/2 + y );
	end
	textbox:setYFlip(true);
	textbox:setAlignment( MOAITextBox.CENTER_JUSTIFY, MOAITextBox.CENTER_JUSTIFY )
	textbox:revealAll()	
	textbox:setColor( 0, 0, 0, 0 );
	
	layer:insertProp( textbox )

	local curve = MOAIAnimCurve.new();
	curve:reserveKeys( 3 );
	curve:setKey ( 1, 0, 0 )
	curve:setKey ( 2, 0.25, 1 )
	curve:setKey ( 3, 0.5, 0 )
	curve:setWrapMode ( MOAIAnimCurve.WRAP )
	
	anim = MOAIAnim.new();
	anim:reserveLinks( 4 );
	anim:setLink( 1, curve, textbox, MOAITextBox.ATTR_R_COL );
	anim:setLink( 2, curve, textbox, MOAITextBox.ATTR_G_COL );
	anim:setLink( 3, curve, textbox, MOAITextBox.ATTR_B_COL );
	anim:setLink( 4, curve, textbox, MOAITextBox.ATTR_A_COL );
	anim:setMode( MOAITimer.LOOP );
	anim:start();
end

function TitleScene.OnUnload()
	
	MOAISim.clearRenderStack()
	
end


function TitleScene.OnUpdate()
		
	if MOAIInputMgr.device.mouseLeft:down() then
		SceneManager.Swap( IntroScene );
	end
	
end

