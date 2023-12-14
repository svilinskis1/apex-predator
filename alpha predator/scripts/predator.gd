#script that controls the scary guy
extends Node2D

func _ready():
	pass

func _process(_delta):
	pass

func _on_trigger_area_entered(area_rid, area, area_shape_index, local_shape_index):
	#when the player enters its area make it appear
	if area.name == "FishArea":
		global.player.max_speed = 40
		$AnimationPlayer.play("appear")
		await($AnimationPlayer.animation_finished)
		transition.change_hunger_bar_visibility(false)
		transition.change_scene("res://scenes/levels/end.tscn")
