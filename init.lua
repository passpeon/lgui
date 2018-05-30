local GUI = {}
GUI._elements = {}

local Renderer
local Window = require(... .. "elements/window")

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
    Renderer = renderer
end

return GUI
