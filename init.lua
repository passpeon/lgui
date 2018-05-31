LGUI = {}
LGUI.BASE_PATH = ...
LGUI.renderer = nil
LGUI.skin = nil

-- Libs
LGUI.class = require(LGUI.BASE_PATH .. ".libs.class")

-- Load elements
require(LGUI.BASE_PATH .. ".elements.element")
require(LGUI.BASE_PATH .. ".elements.window")
require(LGUI.BASE_PATH .. ".elements.panel")

-- Holds all top-level elements (eg. windows)
LGUI._elements = {}

LGUI.init = function(renderer, skin)
    LGUI.renderer = renderer
    LGUI.skin = skin
end

LGUI.draw = function()
    local color = LGUI.renderer.getColor()

    for _, element in ipairs(LGUI._elements) do
        element:draw()
    end

    LGUI.renderer.setColor(color)
end

LGUI.setSkin = function(skin)
    LGUI.skin = skin
end