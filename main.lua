function love.load()
	titulo = love.graphics.newFont("font/visitor.ttf",400)
	subtitulo = love.graphics.newFont("font/visitor.ttf",45)

	i = 0
	dx = 48
	dy = 32

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
	if k == ' ' then i = 0 end
	if k == 'down' then sine = sine + 1 if sine == 5 then sine = 0 end end
	if k == 'left' then efecto = efecto + 1 if efecto == 5 then efecto = 0 end end
	if k == 'up' then if noise == false then noise = true else noise = false end end
	if k == 'right' then if hx == false then hx = true else hx = false end end
end
   
function love.update(dt)
	ruido()

	if efecto == 0 then
		plasma()
	end

	if efecto == 1 then
		barrido()
	end

	if efecto == 2 then
		blanco()
	end

	i = i + 1

	if math.fmod(i,4) == 0 then
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
			buff2[x][y] = buff[x][y]*math.random(1,3)/4
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
		love.graphics.print("Visualkei - VJing App                                  chipmusic", 50 + math.random(-6,6), 465  + math.random(-6,6))
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
			love.graphics.setColor((buff[x][y]*100+40),(buff2[x][y]*100+55),(buff[x][y]*100+40),255)
			end
			
			if paleta == 4 then
			love.graphics.setColor((buff2[x][y]*100+55),(buff[x][y]*100+40),(buff[x][y]*100+40),255)
			end
			
			if paleta == 5 then
			love.graphics.setColor((buff[x][y]*100+40),(buff[x][y]*100+40),(buff2[x][y]*100+55),255)
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

	end end
	end

function math.dist(x1,y1, x2,y2)
	return ((x2-x1)^2+(y2-y1)^2)^0.5
end

function plasma()
	for x=0,dx do for y=0,dy do
		 var1 = 5*math.sin(math.dist(x + math.cos(i*math.pi/24), y+x, 18, i) / 11)
		 var2 = 3*math.sin(math.dist(x, y+i, i+6, 12) / 9)
		 var3 = 4*math.sin(math.dist(math.abs(math.sin(x*math.pi/12)), y, 21, 31) / 10)
		 var4 = 4*math.cos(math.dist(x+i, y, 12, 24) / 8)
		        
		color = math.floor((math.abs(var1+var2+var3+var4)))/4
		
		buff[x][y] = color
	end end
end

function barrido()
	for s = 0,dy do
		buff[dx][s] = 2
	end
	
	if sine == 0 then
		pos_sin = math.floor(8*math.sin(i*math.pi/12) + 8*math.sin(i*math.pi/24)+18)
	end
	
	if sine == 1 then
		pos_sin = math.floor(4*math.sin(i*math.pi/6) + 4*math.cos(i*math.pi/12) + 4*math.sin(i*math.pi/12) + 4*math.sin(i*math.pi/18)+18)
	end
	
	if sine == 2 then
		pos_sin = math.floor(4*math.sin(i*math.pi/6) + 8*math.sin(i*math.pi/12) + 4*math.sin(i*math.pi/18)+18)
	end
	
	if sine == 3 then
		pos_sin = math.floor(10*math.sin(i*math.pi/12)+18)
	end
	
	if sine == 4 then
		pos_sin = math.floor(6*math.cos(i*math.pi/12) + 4*math.sin(i*math.pi/12) + 6*math.sin(i*math.pi/6)+18)
	end
	
	for s = pos_sin,dy do
		buff[dx][s] = 2- 2*(s/dy)
	end
	
	for x = 0,dx-1 do for y = 0,dy do
		buff[x][y] = buff[x+1][y] 
	end end
end

function blanco()
	for x = 0,dx do for y = 0,dy do
		buff[x][y] = 1
	end end
end

