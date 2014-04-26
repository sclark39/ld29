Utility = {};


function Utility.NewSingleUseProp( file, w, h )
	gfx = MOAIGfxQuad2D.new();
	gfx:setRect( -w/2, -h/2, w/2, h/2 );
	gfx:setTexture( file );

	prop = MOAIProp2D.new();
	prop:setDeck( gfx );
	
	return prop;
end
	
	

function Utility.GetRandomNameAndSex()
	local bMale = math.random(2) == 1;
	local firstLkp = bMale and Names.Male or Names.Female;
	
	local name = firstLkp[math.random( #firstLkp )];
	name = name .. " " .. string.char( math.random(26)+64 );
	name = name .. " " .. Names.Surname[math.random( #Names.Surname )];
	
	return name, bMale;
end
