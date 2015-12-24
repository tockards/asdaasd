
function map_collide()
   if player.x < 0 then
     player.x = 0
   end

   if player.y < 0 then
     player.y = 0
   end

   width, height, flags = love.window.getMode()

   if player.y + player.pic:getHeight() > height then
     player.y = height - player.pic:getHeight()
   end

   if player.x + player.pic:getWidth() > width then
     player.x = width - player.pic:getWidth()
   end


end
