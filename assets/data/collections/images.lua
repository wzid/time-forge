---Preloaded graphics for common purposes, like items, objects, effects, etc.

local function load(name)
	return love.graphics.newImage("assets/images/" .. name .. ".png")
end

return {
	-- Overworld objects
	chest = load("chest"),
	fences = load("fences"),
	house = load("house"),
	oak_tree_small = load("oak_tree_small"),
	oak_tree = load("oak_tree"),
	outdoor_decor = load("outdoor_decor"),
	wood_bridge = load("wood_bridge"),

	-- entities
	player_actions = load("player_actions"),
	player = load("player"),
	skeleton = load("skeleton"),
	slime_green = load("slime_green"),
	slime = load("slime"),

	-- animales
	sheep = load("sheep"),
	pig = load("pig"),
	cow = load("cow"),
	chicken = load("chicken"),
}
