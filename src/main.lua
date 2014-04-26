print "Hello world."

local screenw,screenh = 1024,800

MOAISim.openWindow( "Beneath The Surface", screenw, screenh )

local clearColor = MOAIColor.new()
clearColor:setColor( 0,0,0, 1 )
MOAIGfxDevice.setClearColor(clearColor)

viewport = MOAIViewport.new()
viewport:setScale( screenw, screenh )
viewport:setSize( screenw, screenh )

layer = MOAILayer2D.new()
layer:setViewport( viewport )
MOAISim.pushRenderPass( layer )

moaiSplashGfx = MOAIGfxQuad2D.new();
moaiSplashGfx:setTexture( "gfx/splash_moai.png" )
moaiSplashGfx:setRect( -screenw/2, -screenh/2, screenw/2, screenh/2 )

ld29SplashGfx = MOAIGfxQuad2D.new();
ld29SplashGfx:setTexture( "gfx/splash_ld29.png" )
ld29SplashGfx:setRect( -screenw/2, -screenh/2, screenw/2, screenh/2 )

moaiSplashProp = MOAIProp2D.new()
moaiSplashProp:setDeck( moaiSplashGfx )
moaiSplashProp:setLoc(0,0)
moaiSplashProp:setColor( 0,0,0,0 )

ld29SplashProp = MOAIProp2D.new()
ld29SplashProp:setDeck( ld29SplashGfx )
ld29SplashProp:setLoc( 0,0 )
ld29SplashProp:setColor( 0,0,0,0 )

layer:insertProp( moaiSplashProp )
layer:insertProp( ld29SplashProp )

local waittil = MOAICoroutine.blockOnAction;

local fadeThread = MOAICoroutine.new()
fadeThread:run( 
	function()
		waittil( moaiSplashProp:seekColor( 1, 1, 1, 1, 0.5 ) )
		waittil( moaiSplashProp:seekColor( 1, 1, 1, 1, 1.5 ) )
		waittil( moaiSplashProp:seekColor( 0, 0, 0, 0, 0.5 ) )
		waittil( ld29SplashProp:seekColor(  1, 1, 1, 1, 0.5 ) )
		waittil( ld29SplashProp:seekColor(  1, 1, 1, 1, 1.5 ) )
		waittil( ld29SplashProp:seekColor( 0, 0, 0, 0, 0.5 ) )
		
	end
);

