#global script that does a scene transition
extends Node

func change_scene(target: String) -> void:
	$CanvasLayer/AnimationPlayer.play('fade')
	await($CanvasLayer/AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file(target)
	$CanvasLayer/AnimationPlayer.play_backwards('fade')
	
#utility methods
func change_hunger_bar_visibility(visible):
	$CanvasLayer/HungerBar.visible = visible
	
func fade():
	$CanvasLayer/AnimationPlayer.play('fade')
	
func stop_noise():
	$WhaleSoundPlayer.stop()
	$UnderwaterSoundPlayer.stop()
