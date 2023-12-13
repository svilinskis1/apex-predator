#runs at the end of the game
extends Node2D

func _ready():
	#ending cutscene
	await($"/root/transition/CanvasLayer/AnimationPlayer".animation_finished)
	$EatSoundPlayer.play()
	transition.stop_noise()

func _process(_delta):
	pass
