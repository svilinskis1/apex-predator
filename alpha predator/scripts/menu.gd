extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER:
			transition.change_scene("res://scenes/levels/intro.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$subtitle/AnimationPlayer.play("blink")
	await($subtitle/AnimationPlayer.animation_finished)
	pass
