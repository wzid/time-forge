local timer = require("lib.hump.timer")
local anim8 = require("lib.anim8.anim8")

local Splash = NODE:extend()
local TextCharacter = NODE:extend()

local SPLASH_DELAY = .25 -- seconds
local SPLASH_LENGTH = 3.5 -- seconds
local LOGO_TEXT = "wzid studios"


function TextCharacter:new(char, x, y, delay)
    TextCharacter.super.new(self, x, y)
    self._char = char
    self.alpha = 0
    -- initially off to animate downwards
    self.y = self.y - 8

    timer.after(delay, function()
        timer.tween(0.5, self, {y = y, alpha = 255}, "out-elastic", nil, 3, .5)
        timer.tween(0.4, self, {alpha = 255}, "linear")
    end)
end

function TextCharacter:draw()
    love.graphics.setColor(COLORS.white:alpha(self.alpha):unpack())
    love.graphics.print(self._char, self.x, self.y)
    -- TODO: add graphic util for reset color
    love.graphics.setColor(COLORS.white:unpack())
end

function Splash:new()
    Splash.super.new(self)

    self.wzid_image = love.graphics.newImage("assets/images/wzid.png")
    self.wzid_scale = 1.5
    local wzid_grid = anim8.newGrid(16, 16, self.wzid_image:getWidth(), self.wzid_image:getHeight())

    local x, y = WINDOW.half_screen_width, WINDOW.half_screen_height

    love.graphics.setFont(FONTS.big_italic)
    local font = FONTS.big_italic

    -- wzid is 10 off from text and his width
    -- it looks better if we don't account for his scale
    x = x - ((font:getWidth(LOGO_TEXT) + 10 + self.wzid_image:getWidth()) / 2)
    y = y - font:getHeight() / 2

    local text_node = self:add_child(NODE())
    local text_offset = 0
    for i = 1, #LOGO_TEXT do
        local char = LOGO_TEXT:sub(i, i)
        text_node:add_child(TextCharacter(char, x + text_offset, y, SPLASH_DELAY + i * 0.075))
        text_offset = text_offset + font:getWidth(char) + 1
    end

    self.wzid_x = x + text_offset - 10
    --draw rect at y

    self.wzid_y = y - ((self.wzid_image:getHeight() * self.wzid_scale) / 4)
    self.wzid_alpha = 0
    self.wzid_animate = nil

    timer.after(SPLASH_DELAY + .5 + #LOGO_TEXT * .075, function ()
        self.wzid_animate = anim8.newAnimation(wzid_grid('1-2', 1), .3)
        timer.tween(.3, self, {wzid_alpha = 255}, "linear")
        timer.tween(1, self, {wzid_x = self.wzid_x + 10}, "linear", function ()
            self.wzid_animate:pauseAtEnd()
        end)
    end)

    timer.after(SPLASH_DELAY + SPLASH_LENGTH, function ()
        self:die()
        love.graphics.setFont(FONTS.regular)
    end)
end

function Splash:draw()
    if self.wzid_animate then
        love.graphics.setColor(COLORS.white:alpha(self.wzid_alpha):unpack())
        self.wzid_animate:draw(self.wzid_image, self.wzid_x, self.wzid_y, 0, self.wzid_scale, self.wzid_scale)
        love.graphics.setColor(COLORS.white:unpack())
    end
    self.super.draw(self)
end

function Splash:update(dt)
    if self.wzid_animate then
        self.wzid_animate:update(dt)
    end
    self.super.update(self, dt)
end


return Splash