local Renderer = {}

Renderer.rectangle = function(mode, posX, posY, width, height, radiusX, radiusY)
    love.graphics.rectangle(mode, posX, posY, width, height, radiusX, radiusY)
end

return Renderer