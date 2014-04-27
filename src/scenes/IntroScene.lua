IntroScene = {};

function IntroScene.OnLoad()
	
	local layer = MOAILayer2D.new()
	layer:setViewport( viewport )
	MOAISim.pushRenderPass( layer )
	
	local font = MOAIFont.new ()
	font:load( "fnt/JackInput.TTF" )
	local charcodes = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .,:;!?()&/-';
	font:preloadGlyphs ( charcodes, 32 );
 
	local style = MOAITextStyle.new ()
	style:setFont ( font )
	style:setSize ( 32 )
	style:setColor ( 224/255, 199/255, 150/255, 1 )
	
	textbox = MOAITextBox.new();
	textbox:setStyle( style );
	textbox:setString( Strings.IntroText );
	
	do
		local pad = 20;
		local w,h,x,y = screenw - pad*2,screenh - pad*2,0,0;
		textbox:setRect ( -w/2 + x, -h/2 + y, w/2 + x, h/2 + y );
	end
	textbox:setYFlip(true);
	textbox:setAlignment( MOAITextBox.LEFT_JUSTIFY, MOAITextBox.TOP_JUSTIFY )
	
	layer:insertProp( textbox )
	textbox:spool()	

end

function IntroScene.OnUnload()
	
	MOAISim.clearRenderStack()
	
end


function IntroScene.OnUpdate()
		
	if MOAIInputMgr.device.mouseLeft:down() then
		SceneManager.Swap( GameScene );
	end
	
end

