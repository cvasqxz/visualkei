function love.load()

font = love.graphics.newFont("font/visitor.ttf",200)


	love.graphics.setBackgroundColor(255,255,255)
	love.graphics.setMode(768,512,false,false,0)
	
	i = 0
	dx = 47
	dy = 0
	
	noise = false
	sine = 0
	paleta = 0
	
	buff = {}
	for i=0,47 do
	buff[i] = {}
	for j=0,32 do
	buff[i][j] = 2
	end end
	
	buff2 = {}
	for i=0,47 do
	buff2[i] = {}
	for j=0,32 do
	buff2[i][j] = 2
	end end
	

end

function love.keypressed(k)

	if k == 'x' then love.event.quit() end
	
	if k == 'down' then sine = sine + 1 if sine == 5 then sine = 0 end end
	


	if k == 'up' then if noise == false then noise = true else noise = false end end

end
   
function love.update(dt)



	if noise == true then
	
		for x = 0,47 do for y = 0,32 do
			buff2[x][y] = math.random(0,1)/2
		end end
	
	end
	
	
	for s = 0,dy do
		buff[dx][s] = 2
	end
	
	
	if sine == 0 then
	dy = math.floor(8*math.sin(i*math.pi/12) + 8*math.sin(i*math.pi/24)+18)
	end
	
	if sine == 1 then
	dy = math.floor(4*math.sin(i*math.pi/6) + 4*math.cos(i*math.pi/12) + 4*math.sin(i*math.pi/12) + 4*math.sin(i*math.pi/24)+18)
	end
	
	if sine == 2 then
	dy = math.floor(4*math.sin(i*math.pi/6) + 8*math.sin(i*math.pi/12) + 4*math.sin(i*math.pi/24)+18)
	end
	
	if sine == 3 then
	dy = math.floor(10*math.sin(i*math.pi/12)+18)
	end
	
	if sine == 4 then
	dy = math.floor(6*math.cos(i*math.pi/12) + 4*math.sin(i*math.pi/12) + 6*math.sin(i*math.pi/6)+18)
	end
	
	
	for s = dy,32 do
		buff[dx][s] = 2- 2*(s/32)
	end
	
	
	for x = 0,46 do for y = 0,32 do
		buff[x][y] = buff[x+1][y] 
	end end
	
	i = i + 1
	
	if i == 48 then
	i = 0	
	end
	
	if math.fmod(i,4) == 0 then
	
	paleta = math.random(0,5)

	end


end

function love.draw()

	for x=0,47 do for y=0,32 do
	
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
		
	love.graphics.rectangle("fill", (x*16),512-(y*16),16,16)
	end end

	love.graphics.setFont(font)
	love.graphics.setColor(math.random(0,255),math.random(0,255),math.random(0,255))
    love.graphics.print("H33llxz", 70, 170)
end

