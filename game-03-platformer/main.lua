
function love.load()
  sprites = {}
  sprites.coin_sheet = love.graphics.newImage("sprites/coin_sheet.png")
  sprites.player_jump = love.graphics.newImage("sprites/player_jump.png")
  sprites.player_stand = love.graphics.newImage("sprites/player_stand.png")

  require("player")

end

function love.update(dt)

end

function love.draw()
  love.graphics.draw(sprites.player_stand, player.x, player.y)
end
