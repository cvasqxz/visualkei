function love.conf(t)
	t.identity = nil
    t.version = "0.10.1"
    t.console = false

    t.window.title = "VisualKei - 0.1"
    t.window.icon = nil
    t.window.borderless = false
    t.window.resizable = false
	t.window.fullscreen = true
    t.window.vsync = true
    t.window.fsaa = 0
    t.window.display = 1
    t.window.highdpi = true
    t.window.srgb = true

    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = false
    t.modules.sound = false
    t.modules.system = true
    t.modules.timer = true
    t.modules.window = true
end
