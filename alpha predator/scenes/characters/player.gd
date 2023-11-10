extends CharacterBody2D

var flipped = false

var speed = 0
var max_speed = 75
var rotation_speed = 2
var acceleration = 100

var rotation_direction = 0

func get_input(delta):
	rotation_direction = Input.get_axis("left", "right")
	
	speed += acceleration * delta
	speed = min(speed, max_speed)
	
	velocity = transform.x * Input.get_axis("back", "forward") * speed

func _physics_process(delta):
	
	get_input(delta)
	rotation += rotation_direction * rotation_speed * delta
		
	if rotation < -PI/2 or rotation > PI/2:
		flipped = true
	else:
		flipped = false
		
	$Anglerfish.set_flip_v(flipped)
	
	if flipped:	
		$Anglerfish/Light.offset.y = 8
	else:
		$Anglerfish/Light.offset.y =  0
		
	move_and_slide()
