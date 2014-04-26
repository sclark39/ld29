Utility = {};


function Utility.NewSingleUseProp( file, w, h )
	gfx = MOAIGfxQuad2D.new();
	gfx:setRect( -w/2, -h/2, w/2, h/2 );
	gfx:setTexture( file );

	prop = MOAIProp2D.new();
	prop:setDeck( gfx );
	
	return prop;
end
	