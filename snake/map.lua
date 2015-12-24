function map_collide(object)
   if object.x < 0 then
     object.x = 0
   end

   if object.y < 0 then
     object.y = 0
   end

   width, height, flags = love.window.getMode()

   if object.y + object.h > height then
     object.y = height - object.h
   end

   if object.x + object.w > width then
     object.x = width  - object.w
   end


end
