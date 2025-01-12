---Global variables for commonly used tables, like collections, libraries, and Node.
---All globals are immutable tables, and named in UPPER_SNAKE_CASE.
---
---None of the internal base code relies on these; you can safely delete them.
---However, I'd advise against it, as you can reasonably expect every single module
---to use one or multiple of them, and they're clearly marked and defined in one
---place.

-- Classes
NODE = require("base.Node")
SIGNAL = require("base.Signal")

-- Singletons
INPUT = require("base.singleton.Input")
WINDOW = require("base.singleton.Window")
DEBUG = require("base.singleton.Debug")

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
ANIMATIONS = require("assets.data.collections.animations")
COLORS = require("assets.data.collections.colors")
FONTS = require("assets.data.collections.fonts")
IMAGES = require("assets.data.collections.images")
SOUNDS = require("assets.data.collections.sounds")

LIB.log.trace("Loaded globals")
