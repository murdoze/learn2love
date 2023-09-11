io.stdout:setvbuf("no")

-- Constants

g = -9.81


-- Params

dt = 0.3

m = 100
F = 1300
Angle = 30
Angle2 = 60

X0 = 000
Y0 = 600

-- Tracer

trace = {}
trace2 = {}
tr = 1

-- Rocket velocities

X = X0
Y = Y0

X2 = X0
Y2 = 1200

Vh = 0
Vv = 0

V0 = 390



function love.update()
---  if Y < 10 then return end

  sin = math.sin(Angle * math.pi / 180)
  cos = math.cos(Angle * math.pi / 180)

  sin2 = math.sin(Angle2 * math.pi / 180)
  cos2 = math.cos(Angle2 * math.pi / 180)


  Fv = F * sin
  Fh = F * cos

  V0x = V0 * cos2
  V0y = V0 * sin2

  Ah = Fh / m
  Av0 = Fv / m

  Av = Av0 + g

  Vh = Vh + Ah * dt
  Vv = Vv + Av * dt
  Vy = Vv + g * dt

  
  X = X + Vh * dt
  Y = Y + Av * dt * dt / 2

  X2 = X2 + V0x * dt 
  Y2 = Y2 - V0y * dt - Vy * dt + Av * dt * dt / 2



  trace[tr] = { X, Y }
  trace2[tr] = { X2, Y2 }
  tr = tr + 1

  -- print(
  --  "Av = ", Av, 
  --  " X = ", X, 
  --  " Y = ", Y)

end


function love.draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.line(0, Y0, 10000, Y0)


  -- Rocket
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", X*0.01, Y, 5, 5)

   love.graphics.setColor(1, 1, 0)
  for _, value in ipairs(trace) do 
    xt = value[1]
    yt = value[2]
    love.graphics.circle("fill", xt*0.01, yt, 1, 20)
  end

  -- Bullet
  love.graphics.setColor(1, 1, 0)
  love.graphics.circle("fill", X2*0.02, Y2*0.02 + 600, 5, 5)

  love.graphics.setColor(0, 1, 1)
  for _, value in ipairs(trace2) do 
    xt = value[1]
    yt = value[2]
    love.graphics.circle("fill", xt*0.02, yt*0.02 + 600, 1, 20)
  end

   

end


