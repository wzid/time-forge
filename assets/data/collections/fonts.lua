-- TODO: need to add more font types
local fonts = {
	regular = love.graphics.newFont("assets/fonts/monogram.ttf", 16),
}

fonts.small:setLineHeight(0.7)

return fonts
