local push = require("lib.push.push")
local timer = require("lib.hump.timer")
local log = require("lib.log.log")
local colors = require("assets.collections.colors")
local Window = require("engine.singleton.Window")
local Input = require("engine.singleton.Input")
local Debug = require("engine.singleton.Debug")
local Node
local root


function love.load()
	Window:setup(3)
	love.window.setTitle("Project Skeleton")
	push:setBorderColor(colors.black_23:unpack())

	Node = require("engine.Node")
	root = Node()

	require("globals")
	require("src")(root)
	log.info("Finished loading")
end

function love.update(dt)
	Input:update()
	timer.update(dt)
	root:update(dt)
	Debug:update(dt)
end

function love.draw()
	push:start()
	root:draw()
	Debug:draw()
	push:finish()
end
