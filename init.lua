local GUI = {}
GUI._elements = {}

LGUI_BASE_PATH = ...
local Window = require(... .. ".elements.window")

GUI.create = function(type)
    if type == "window" then
        return Window(GUI)
    end
end

GUI.draw = function()
    for _, element in ipairs(GUI._elements) do
        element:draw()
    end
end

GUI.setRenderer = function(renderer)
    GUI.renderer = renderer
end

return GUI
