extends Node

func change_scene(target: String) -> void:
	$CanvasLayer/AnimationPlayer.play('fade')
	await($CanvasLayer/AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
	$CanvasLayer/AnimationPlayer.play_backwards('fade')
