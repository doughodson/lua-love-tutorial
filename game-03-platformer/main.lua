
function love.load()
  myWorld = love.physics.newWorld(0, 500, false)
  myWorld:setCallbacks(beginContact, endContact, preSolve, postSolve)

  sprites = {}
  sprites.coin_sheet = love.graphics.newImage("sprites/coin_sheet.png")
  sprites.player_jump = love.graphics.newImage("sprites/player_jump.png")
  sprites.player_stand = love.graphics.newImage("sprites/player_stand.png")
  sprites.player_jump = love.graphics.newImage("sprites/player_jump.png")

  require("player")

  platforms = {}
  spawn_platform(50, 400, 300, 30)
end

function love.update(dt)
  myWorld:update(dt)
  playerUpdate(dt)
end

function love.draw()
  love.graphics.draw(player.sprite, player.body:getX(), player.body:getY(), nil,
                     player.direction, 1,
                     player.sprite:getWidth()/2, player.sprite:getHeight()/2)

  for i,p in ipairs(platforms) do
    love.graphics.rectangle("fill", p.body:getX(), p.body:getY(), p.width, p.height)
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "up" and player.grounded == true then
    player.body:applyLinearImpulse(0, -2500)
  end
end

function spawn_platform(x, y, width, height)
  local platform = {}
  platform.body = love.physics.newBody(myWorld, x, y, "static")
  platform.shape = love.physics.newRectangleShape(width/2, height/2, width, height)
  platform.fixture = love.physics.newFixture(platform.body, platform.shape)
  platform.width = width
  platform.height = height

  table.insert(platforms, platform)
end

function beginContact(a, b, coll)
  player.grounded = true
end

function endContact(a, b, coll)
  player.grounded = false
end
