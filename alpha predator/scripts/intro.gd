#controls the intro cutscene
extends Node2D


func _ready(): 
	#play the intro cutscene then go to main
	$subtitle/AnimationPlayer.play("intro_text")
	await($subtitle/AnimationPlayer.animation_finished)
	transition.change_scene("res://scenes/levels/main.tscn")

func _process(_delta):
	pass
