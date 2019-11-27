
function love.load()
  adi_images = {}
  adi_images.adi = love.graphics.newImage('images/adi/adi.svg')
end

function love.update(dt)

end

function love.draw()
  love.graphics.draw(adi_images.adi, 100, 100)
end
