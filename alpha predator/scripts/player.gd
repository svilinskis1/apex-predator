extends CharacterBody2D

var max_speed = 100
var acceleration = 150
var deceleration = 100

var rotation_speed = 0
var rotation_deceleration = 5
var rotation_direction = 0

var input
var hunger
var flipped

func _ready():
	hunger = global.hunger
	hunger = 0
	input = 0
	flipped = false
	
func get_input():
	input = int(Input.is_action_pressed("forward"))
	rotation_direction = Input.get_axis("left", "right")
	
	return input
	
func flip_sprite():
	if rotation < -PI/2 or rotation > PI/2:
		flipped = true
	else:
		flipped = false
		
	$Anglerfish.set_flip_v(flipped)

func _physics_process(delta):
	input = get_input()
	
	if input == 0:
		if velocity.length() > deceleration * delta:
			velocity -= velocity.normalized() * (deceleration * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (transform.x * input * acceleration * delta)
		velocity = velocity.limit_length(max_speed)
		
	if rotation_direction == 0:
		if rotation_speed > 0:
			rotation_speed -= rotation_deceleration * delta * rotation_direction
		else:
			rotation_speed = 0
	else:
		rotation_speed = 3
	
	rotation += rotation_direction * rotation_speed * delta
		
	flip_sprite()
		
	move_and_slide()
