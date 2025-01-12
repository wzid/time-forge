---Global variables for commonly used tables, like collections, libraries, and Node.
---All globals are immutable tables, and named in UPPER_SNAKE_CASE.
---
---None of the internal base code relies on these; you can safely delete them.
---However, I'd advise against it, as you can reasonably expect every single module
---to use one or multiple of them, and they're clearly marked and defined in one
---place.

-- Classes
NODE = require("engine.Node")
SIGNAL = require("engine.Signal")

-- Singletons
INPUT = require("engine.singleton.Input")
WINDOW = require("engine.singleton.Window")
DEBUG = require("engine.singleton.Debug")

-- Libraries
LIB = {
	anim8 = require("lib.anim8.anim8"),
	baton = require("lib.baton.baton"),
	batteries = require("lib.batteries"),
	bump = require("lib.bump.bump"),
	classic = require("lib.classic.classic"),
	timer = require("lib.hump.timer"),
	inspect = require("lib.inspect.inspect"),
	log = require("lib.log.log"),
	moses = require("lib.moses.moses"),
	push = require("lib.push.push")
}

-- Collections
COLORS = require("assets.collections.colors")
FONTS = require("assets.collections.fonts")
IMAGES = require("assets.collections.images")
SOUNDS = require("assets.collections.sounds")

LIB.log.trace("Loaded globals")
