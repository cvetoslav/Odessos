extends Node2D


var rng = RandomNumberGenerator.new()
var flowDir = 180
var flowSpeed = 1.2
var flow_vec = Vector2(0, 0)

var windDir = 180
var windSpeed = 5
var wind_vec = Vector2(0, 1)

var velocity = 0
var boat_dir = Vector2(0, -1)
var boat_vel = Vector2(0, 0)
var mass = 0

var endpoints = []
var epSprites = []
var loctexture = preload("res://location.png")
var terrain_texture = preload("res://terrain.png")
var island_texture = preload("res://island.png")
var ship_texture = preload("res://ship.png")
var noise = OpenSimplexNoise.new()
var ship_sp = Sprite.new()

var coast_matrix = []
var is1 = []
var is2 = []
var is3 = []
var ship = []
var ship_vel = Vector2(0, 10)

var rotSpeed = 55
var running = false

var speed_dep = [0, 0, 0, 2.5, 5, 6.2, 7.1, 7.9, 8, 8.1, 8, 7.9, 7.8, 7.7, 7.6, 7.5, 7.4, 7.3, 7.2, 7]

func sail_int():
	var rot = $SailBoat/MainSail.rotation_degrees * 2
	rot = int(round(abs(rot/10)))
	return windSpeed*speed_dep[rot]*15.0/(15+mass)

func _ready():
	rng.randomize()
	
	noise.seed = rng.randi()
	noise.octaves = 3
	noise.period = 250.0
	noise.persistence = 0.8
	for i in range(0, 760):
		coast_matrix.append(230+100*noise.get_noise_1d(i))
	
	var is1_1 = []
	var is2_1 = []
	var is3_1 = []
	noise.period = 130
	for i in range(0, 330):
		var asd = noise.get_noise_1d(i)*60
		is1.push_back(Vector2(500, 350) + Vector2(sin(deg2rad(i)), cos(deg2rad(i)))*(asd+100))
		is1_1.push_back(Vector2(500, 350) + Vector2(sin(deg2rad(i)), cos(deg2rad(i)))*(asd+80))
	for i in range(0, 330):
		var asd = noise.get_noise_1d(360+i)*60
		is2.push_back(Vector2(1300, 300) + Vector2(sin(deg2rad(i)), cos(deg2rad(i)))*(asd+100))
		is2_1.push_back(Vector2(1300, 300) + Vector2(sin(deg2rad(i)), cos(deg2rad(i)))*(asd+80))
	for i in range(0, 330):
		var asd = noise.get_noise_1d(720+i)*60
		is3.push_back(Vector2(800, 650) + Vector2(sin(deg2rad(i)), cos(deg2rad(i)))*(asd+100))
		is3_1.push_back(Vector2(800, 650) + Vector2(sin(deg2rad(i)), cos(deg2rad(i)))*(asd+80))
	
	var coast_poly = []
	
	for i in range(0, 760):
		coast_poly.append(Vector2(coast_matrix[i], i+102))
	for i in range(0, 760):
		coast_poly.append(Vector2(0, 760-i-1+102))
	
	var x0=1000
	var y0=50
	var w=30
	var h=300
	ship = [Vector2(x0,y0), Vector2(x0+w,y0), Vector2(x0+w,y0+h), Vector2(x0,y0+h)]
	ship_sp.texture = ship_texture
	ship_sp.scale = Vector2(0.6, 0.5)
	ship_sp.rotate(PI)
	ship_sp.position = Vector2(x0+w/2+1, y0+100)
	ship_sp.z_index = -1
	add_child(ship_sp)
	
	terrain_texture.flags += 2
	island_texture.flags += 2
	var p = Polygon2D.new()
	p.polygon = PoolVector2Array(coast_poly)
	p.texture = terrain_texture
	add_child(p)
	
	p = Polygon2D.new()
	p.polygon = PoolVector2Array(is1_1)
	p.texture = island_texture
	add_child(p)
	
	p = Polygon2D.new()
	p.polygon = PoolVector2Array(is2_1)
	p.texture = island_texture
	add_child(p)
	
	p = Polygon2D.new()
	p.polygon = PoolVector2Array(is3_1)
	p.texture = island_texture
	add_child(p)
	
	$SailBoat.position = Vector2(coast_matrix[600] + 40, 600+102)

func _on_MainTimer_timeout():
	windDir = $WindArrow.rotation_degrees
	windDir = rng.randi_range(windDir-1, windDir+1)
	if windDir < 0:
		windDir += 360
	if windDir > 360:
		windDir -= 360
	$WindArrow.change_dir(windDir)
	$WindDir.text = str(int(windDir+180)%360) + "°"
	$WindSpeed.text = str(windSpeed) + " m/s"
	wind_vec.x = sin($WindArrow.rotation)
	wind_vec.y = -cos($WindArrow.rotation)
	wind_vec *= windSpeed
	flowDir = $FlowArrow.rotation_degrees
	flowDir = rng.randi_range(flowDir-2, flowDir+2)
	if flowDir < 0:
		flowDir += 360
	if flowDir > 360:
		flowDir -= 360
	$FlowArrow.change_dir(flowDir)
	$FlowDir.text = str(int(flowDir+180)%360) + "°"
	$FlowSpeed.text = str(flowSpeed) + " m/s"
	flow_vec.x = sin($FlowArrow.rotation)
	flow_vec.y = -cos($FlowArrow.rotation)
	flow_vec *= flowSpeed
	
func rotate_vec(vec: Vector2, a):
	return Vector2(vec.x*cos(a) - vec.y*sin(a), vec.x*sin(a) + vec.y*cos(a))

func isbetween(a, b, c):
	if (a.x * b.y - a.y * b.x)*(a.x * c.y - a.y * c.x) >= 0 and (c.x * b.y - c.y * b.x)*(c.x * a.y - c.y * a.x) >= 0:
		return true
	return false
	
func douknowdawae(b):
	var mind = INF
	var a = is1[329] - $SailBoat.position
	var c = is1[0] - $SailBoat.position
	if isbetween(a,b,c):
		mind = min(a.length(), c.length())
	for i in range(1,330):
		a = c
		c = is1[i] - $SailBoat.position
		if isbetween(a,b,c):
			mind = min(mind, min(a.length(), c.length()))
	a = is2[329] - $SailBoat.position
	c = is2[0] - $SailBoat.position
	if isbetween(a,b,c):
		mind = min(a.length(), c.length())
	for i in range(1,330):
		a = c
		c = is2[i] - $SailBoat.position
		if isbetween(a,b,c):
			mind = min(mind, min(a.length(), c.length()))
	a = is3[329] - $SailBoat.position
	c = is3[0] - $SailBoat.position
	if isbetween(a,b,c):
		mind = min(a.length(), c.length())
	for i in range(1,330):
		a = c
		c = is3[i] - $SailBoat.position
		if isbetween(a,b,c):
			mind = min(mind, min(a.length(), c.length()))
	a = ship[3] - $SailBoat.position
	c = ship[0] - $SailBoat.position
	if isbetween(a,b,c):
		mind = min(a.length(), c.length())
	for i in range(1,4):
		a = c
		c = ship[i] - $SailBoat.position
		if isbetween(a,b,c):
			mind = min(mind, min(a.length(), c.length()))
	a = Vector2(coast_matrix[0], 102) - $SailBoat.position
	c = Vector2(coast_matrix[1], 103) - $SailBoat.position
	if isbetween(a,b,c):
		mind = min(a.length(), c.length())
	for i in range(2,760):
		a = c
		c = Vector2(coast_matrix[i], 102+i) - $SailBoat.position
		if isbetween(a,b,c):
			mind = min(mind, min(a.length(), c.length()))
	return mind
	
func sinang(a, b):
	var cp = (a.x * b.y) - (a.y * b.x)
	return cp/a.length()/b.length()
	
func cosang(a, b):
	var cp = a.dot(b)
	return cp/a.length()/b.length()

var lh = Vector2(0,1)
var rh = Vector2(0,1)

func _process(delta):
	mass = int($LineEdit.text)
	var rotDir = 0
	if Input.is_action_pressed("ui_left"):
		rotDir += -1
	if Input.is_action_pressed("ui_right"):
		rotDir += 1
	if Input.is_action_just_pressed("ui_rclick"):
		var pos = get_viewport().get_mouse_position()
		var img = get_viewport().get_texture().get_data()
		img.flip_y()
		img.lock()
		if img.get_pixel(pos.x, pos.y) != Color(0,200,0):
			endpoints.push_back(pos)
			var sp = Sprite.new()
			sp.set_texture(loctexture)
			sp.position = pos
			sp.scale = Vector2(0.03, 0.03)
			epSprites.push_back(sp)
			add_child(sp)
		img.unlock()
		
	lh = rotate_vec(-wind_vec, PI/4) * 100
	rh = rotate_vec(-wind_vec, -PI/4) * 100
	
	var radvec = lh
	if endpoints.size() > 0:
		radvec = endpoints[0] - $SailBoat.position
	if radvec.length() <= 10 and endpoints.size() > 1:
		endpoints.pop_front()
		remove_child(epSprites[0])
		epSprites.pop_front()
		radvec = endpoints[0] - $SailBoat.position
		
	var ang = acos(cosang(-radvec, wind_vec))
	if abs(ang) < PI/4: # upwind
		if acos(cosang(radvec-lh.normalized()*90, lh)) < PI/4:
			radvec = lh
		elif acos(cosang(radvec-rh.normalized()*90, rh)) < PI/4:
			radvec = rh
		else:
			if acos(cosang(boat_dir, lh)) < acos(cosang(boat_dir, rh)):
				radvec = lh
			else:
				radvec = rh
		var ld = douknowdawae(lh)
		var rd = douknowdawae(rh)
		if endpoints.size() > 0 and min(ld, rd) < (endpoints[0] - $SailBoat.position).length():
			if ld + 30 < rd:
				radvec = rh
			elif ld > rd + 30:
				radvec = lh
	else: # downwind
		if douknowdawae(radvec) < radvec.length():
			var upv = radvec
			var dov = radvec
			var ang1 = 0
			var ang2 = 0
			var dang = PI/18
			var x = upv
			while dang > PI/180:
				ang1 += dang
				x = rotate_vec(upv, ang1)
				if douknowdawae(x) >= radvec.length():
					ang1 -= dang
					dang /= 2
			upv = x
			x = dov
			dang = PI/18
			while dang > PI/180:
				ang2 += dang
				x = rotate_vec(dov, -ang2)
				if douknowdawae(x) >= radvec.length():
					ang2 -= dang
					dang /= 2
			dov = rotate_vec(x, -PI/90)
			if ang1 < ang2:
				if abs(acos(cosang(-upv, wind_vec))) > PI/4:
					radvec = upv
				else:
					radvec = dov
			else:
				if abs(acos(cosang(-dov, wind_vec))) > PI/4:
					radvec = dov
				else:
					radvec = upv
	
	ang = asin(sinang(boat_dir, radvec))
	if abs(ang) < rotSpeed * delta / 180 * PI:
		rotDir = 0
		$SailBoat.rotation += ang
	elif ang < 0:
		rotDir = -1
	else:
		rotDir = 1
		
	$SailBoat.rotation_degrees += rotDir * rotSpeed * delta
	if $SailBoat.rotation_degrees > 360:
		$SailBoat.rotation_degrees -= 360
	if $SailBoat.rotation_degrees < -360:
		$SailBoat.rotation_degrees += 360
	
	#var aw = wind_vec - boat_vel
	#windDir = atan(-aw.x/aw.y)
	var newRot = windDir - $SailBoat.rotation_degrees - 180
	if newRot > 180:
		newRot -= 360
	if newRot < -180:
		newRot += 360
		
	if newRot > 0:
		$SailBoat/MainSail.flip_h = true
		$SailBoat/Jib.flip_h = true
	else:
		$SailBoat/MainSail.flip_h = false
		$SailBoat/Jib.flip_h = false
		
	$SailBoat/MainSail.rotation_degrees = newRot/2
	$SailBoat/Jib.rotation_degrees = newRot/2
	
	var rv = 0
	if boat_vel.length()*flow_vec.length() > 0:
		flow_vec.length()*(boat_vel.dot(-flow_vec)/boat_vel.length()/flow_vec.length())
	var tar_v = sail_int()
	var dt = 0.0001 * (15 + mass*10) * (rv+velocity)
	var dv = (tar_v - velocity) * delta / (dt+delta)
	velocity = max(0, velocity + dv)
	
	boat_dir.x = sin($SailBoat.rotation)
	boat_dir.y = -cos($SailBoat.rotation)
	if not running:
		delta = 0
	boat_vel = boat_dir * velocity
	$SailBoat.position += boat_vel * delta
	
	for i in range(4):
		ship[i] += ship_vel * delta
	
	ship_sp.position += ship_vel * delta
	
	$BoatVelocityLabel.text = str(stepify(velocity/windSpeed/2, 0.01)) + " m/s"
	update()
	
func _draw():
	if endpoints.size() > 0:
		draw_line(endpoints[0], $SailBoat.position, Color(255, 0, 0), 1)
		draw_line(endpoints[0], endpoints[0] - lh, Color(0, 255, 0), 1)
		draw_line(endpoints[0], endpoints[0] - rh, Color(0, 0, 255), 1)
	
	#draw_polygon(ship, PoolColorArray([Color(0,0,200)]))

func _on_Button_button_down():
	# mass = int($LineEdit.text)
	if running:
		$Button.text = "START"
	else:
		$Button.text = "PAUSE"
	running = !running
