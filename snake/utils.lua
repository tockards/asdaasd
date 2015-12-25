-- Collision detection function.
-- Returns true if two boxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first box, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second box
function CheckCollision(object1, object2)
  -- Checks collisions between two objects
  x1,y1,w1,h1 = object1:return_coords()
  x2,y2,w2,h2 = object2:return_coords()

  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
