extends CharacterBody2D

var speed = 0
const max_speed = 50
const acceleration = 100
var fleeing = false
var player_position
var target

func _physics_process(delta):
	if not fleeing:	
		return	
	player_position = global.player.position
	target = (player_position - position).normalized()
	
	look_at(player_position)
	
	speed += acceleration * delta
	speed = min(speed, max_speed)
	velocity = position.direction_to(target) * -speed
	move_and_slide()
	
func on_shape_entered(area):
	if area.name == "LightArea":
		fleeing = true
	if area.name == "EatArea":
		global.hunger += 1
		queue_free()