#controls the prey fish
extends CharacterBody2D

var food = 25
var speed = 0
const max_speed = 60
const acceleration = 100
var fleeing = false
var player_position
var target

func _physics_process(delta):
	if not fleeing:	
		return	
		
	#run away from the player
	player_position = global.player.position
	target = (player_position - position).normalized()
	
	look_at(player_position)
	
	speed += acceleration * delta
	speed = min(speed, max_speed)
	velocity = position.direction_to(target) * -speed
	move_and_slide()
	
func on_shape_entered(area):
	#when the player gets close they run away
	if area.name == "LightArea":
		fleeing = true
	#if player catches them they get eaten
	if area.name == "EatArea":
		global.change_hunger.emit(food)
		queue_free()
