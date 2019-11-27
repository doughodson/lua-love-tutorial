
function love.load()
  sprites = {}
  sprites.player = love.graphics.newImage('sprites/player.png')
  sprites.bullet = love.graphics.newImage('sprites/bullet.png')
  sprites.zombie = love.graphics.newImage('sprites/zombie.png')
  sprites.background = love.graphics.newImage('sprites/background.png')

  player = {}
  player.x = 200
  player.y = 200
  player.speed = 180

  zombies = {}
end

function love.update(dt)
  if love.keyboard.isDown("s") then
    player.y = player.y + player.speed * dt
  end
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed * dt
  end
  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed * dt
  end
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed * dt
  end

  for i,z in ipairs(zombies) do
    z.x = z.x + math.cos(zombie_player_angle(z)) * z.speed * dt
    z.y = z.y + math.sin(zombie_player_angle(z)) * z.speed * dt
  end

end

function love.draw()
  love.graphics.draw(sprites.background, 0, 0)
  love.graphics.draw(sprites.player, player.x, player.y, player_mouse_angle(),
                     nil, nil,                          -- scale factor
                     sprites.player:getWidth()/2, sprites.player:getHeight()/2)

  for i,z in ipairs(zombies) do
    love.graphics.draw(sprites.zombie, z.x, z.y, zombie_player_angle(z),
                       nil, nil,
                       sprites.zombie:getWidth()/2, sprites.zombie:getHeight()/2)
  end

end

function player_mouse_angle()
  return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end

function zombie_player_angle(enemy)
  return math.atan2(player.y - enemy.y, player.x - enemy.x)
end

function spawn_zombie()
  zombie = {}
  zombie.x = math.random(0, love.graphics.getWidth())
  zombie.y = math.random(0, love.graphics.getHeight())
  zombie.speed = 100

  table.insert(zombies, zombie)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "space" then
    spawn_zombie()
  end
end
