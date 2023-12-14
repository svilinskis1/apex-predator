#script for the main gameplay scene
extends Node2D

func _ready():
	#activate hunger bar
	transition.change_hunger_bar_visibility(true)

func _process(_delta):
	pass
	
func _input(event):
	#quits the game if you hit esc 
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()
