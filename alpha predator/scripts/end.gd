extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await($"/root/transition/CanvasLayer/AnimationPlayer".animation_finished)
	$EatSoundPlayer.play()
	transition.stop_noise()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
