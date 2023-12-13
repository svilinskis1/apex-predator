#controls the main menu
extends Node2D

func _ready():
	pass

func _input(event):
	#go to the intro when enter is pressed
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ENTER:
			transition.change_scene("res://scenes/levels/intro.tscn")

func _process(_delta):
	#animates the "press enter to start" text
	$subtitle/AnimationPlayer.play("blink")
	await($subtitle/AnimationPlayer.animation_finished)
	pass
