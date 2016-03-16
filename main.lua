function love.load()
	titulo = love.graphics.newFont("font/visitor.ttf",400)
	subtitulo = love.graphics.newFont("font/visitor.ttf",45)
	fps = love.graphics.newFont("font/visitor.ttf",25)

	i = 0
	zoom = 5
	dx = 13*zoom
	dy = 9*zoom

	screen_y = love.graphics.getHeight()/dy
	screen_x = love.graphics.getWidth()/dx

	noise = false
	hx = true
	sine = 0
	paleta = 0
	efecto = 0

	buff = {}
	for i=0,dx do
		buff[i] = {}
		for j=0,dy do
			buff[i][j] = 2
		end
	end

	buff2 = {}
	for i=0,dx do
		buff2[i] = {}
		for j=0,dy do
			buff2[i][j] = 2
		end
	end
end

function love.keypressed(k)
	if k == 'x' then love.event.quit() end
	if k == 'up' then if noise == false then noise = true else noise = false end end
	if k == 'down' then sine = sine + 1 if sine == 5 then sine = 0 end end
	if k == 'left' then efecto = efecto + 1 if efecto == 3 then efecto = 0 end end
	if k == 'right' then if hx == false then hx = true else hx = false end end
end
   
function love.update(dt)
	ruido()

	if efecto == 0 then
		noise = true
		plasma()
	end

	if efecto == 1 then
		noise = true
		barrido()
	end

	if efecto == 2 then
		noise = false
		fuego()
	end

	if  0 < i and i < 360 then
		i = i + 1
	else
		i = i - 1
	end

	if math.fmod(i,2) == 0 then
		paleta = math.random(0,5)
	end
end

function love.draw()
	draw()
	heellxz()
end

function ruido()
	if noise == true then
		for x = 0,dx do for y = 0,dy do
			buff2[x][y] = buff[x][y]*math.random(1,2)/5
		end end
	end
end

function heellxz()
	if hx == true then
		love.graphics.setFont(titulo)
		love.graphics.setColor(math.random(50,255),math.random(50,255),math.random(50,255))
		love.graphics.print("H33llxz",45 + math.random(-10,10), 230 + math.random(-10,10))
		love.graphics.setFont(subtitulo)
		love.graphics.setColor(math.random(50,255),math.random(50,255),math.random(50,255))
		love.graphics.print("Visualkei - VJing App                                  chipmusic ", 50 + math.random(-3,3), 465  + math.random(-3,3))
		love.graphics.setFont(fps)
		love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 5, 0)
	end
end

function draw()
	for x=0,dx do for y=0,dy do
		if noise == true then
			if paleta == 0 then
			love.graphics.setColor((buff[x][y]*100+40),0,(buff2[x][y]*100+55),255)
			end
			
			if paleta == 1 then
			love.graphics.setColor(0,(buff[x][y]*100+40),(buff2[x][y]*100+55),255)
			end
			
			if paleta == 2 then
			love.graphics.setColor(0,(buff2[x][y]*100+55),(buff[x][y]*100+40),255)
			end
			
			if paleta == 3 then
			love.graphics.setColor((buff[x][y]*100+40),0,(buff2[x][y]*100+55),255)
			end
			
			if paleta == 4 then
			love.graphics.setColor(0,(buff2[x][y]*100+55),(buff[x][y]*100+40),255)
			end
			
			if paleta == 5 then
			love.graphics.setColor((buff[x][y]*100+40),(buff2[x][y]*100+55),0,255)
			end

		else
			
			if paleta == 0 then
			love.graphics.setColor((buff[x][y]*100+40),0,55,255)
			end

			if paleta == 1 then
			love.graphics.setColor(0,(buff[x][y]*100+40),55,255)
			end

			if paleta == 2 then
			love.graphics.setColor(0,55,(buff[x][y]*100+40),255)
			end

			if paleta == 3 then
			love.graphics.setColor((buff[x][y]*100+40),0,(buff[x][y]*100+40),255)
			end
			
			if paleta == 4 then
			love.graphics.setColor(0,(buff[x][y]*100+40),(buff[x][y]*100+40),255)
			end
			
			if paleta == 5 then
			love.graphics.setColor((buff[x][y]*100+40),(buff[x][y]*100+40),0,255)
			end

		end
		
		love.graphics.rectangle("fill", (x*screen_x),love.graphics.getHeight()-(y*screen_y),screen_x,screen_y)
		buff2[x][y] = buff[x][y]
	end end
	end

function math.dist(x1,y1, x2,y2)
	return ((x2-x1)^2+(y2-y1)^2)^0.5
end

function plasma()
	for x=0,dx do for y=0,dy do
		 var1 = 5*math.sin(math.dist(x + math.cos(i*math.pi/24), y+x, 18, i) / 11)
		 var2 = 3*math.sin(math.dist(x, y+i, i+3, 6) / 9)
		 var3 = 4*math.sin(math.dist(math.abs(math.sin(x*math.pi/15)), y, 21, 31) / 10)
		 var4 = 4*math.cos(math.dist(x+i, y, 6, 24) / 8)
		        
		color = math.abs((var1+var2+var3+var4))/6
		
		buff[x][y] = color
	end end
end

function barrido()
	for s = 0,dy do
		buff[dx][s] = 2
	end
	
	if sine == 0 then
		pos_sin = math.floor((dy/4)*math.sin(i*math.pi/15) + (dy/4)*math.sin(i*math.pi/12)+dy/2)
	end
	
	if sine == 1 then
		pos_sin = math.floor((dy/8)*math.sin(i*math.pi/9) + (dy/8)*math.cos(i*math.pi/15) + (dy/8)*math.sin(i*math.pi/15) + (dy/8)*math.sin(i*math.pi/12)+dy/2)
	end
	
	if sine == 2 then
		pos_sin = math.floor((dy/8)*math.sin(i*math.pi/9) + (dy/4)*math.sin(i*math.pi/15) + (dy/8)*math.sin(i*math.pi/12)+dy/2)
	end
	
	if sine == 3 then
		pos_sin = math.floor((dy/3)*math.sin(i*math.pi/15)+dy/2)
	end
	
	if sine == 4 then
		pos_sin = math.floor((dy/12)*math.cos(i*math.pi/15) + (dy/6)*math.sin(i*math.pi/15) + (dy/4)*math.sin(i*math.pi/9)+dy/2)
	end
	
	for s = pos_sin,dy do
		buff[dx][s] = 2- 2*(s/dy)
	end
	
	for x = 0,dx-1 do for y = 0,dy do
		buff[x][y] = buff[x+1][y] 
	end end
end

function fuego()
	for j = 0,dx do
		buff2[j][0] = math.random(0,10)
		buff2[j][1] = math.random(0,10)
		buff[j][0] = math.random(0,10)
		buff[j][1] = math.random(0,10)
	end
	
	for x = 0,dx do for y = 1,dy-1 do
		buff[x][y+1] = ((buff2[x][y] + buff2[x][y+1] + buff2[x][y-1]) / 4) - math.random(0,0.1)
	end end
   
end
