extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_trigger_area_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "FishArea":
		global.player.max_speed = 40
		$AnimationPlayer.play("appear")
		await($AnimationPlayer.animation_finished)
		transition.change_hunger_bar_visibility(false)
		transition.change_scene("res://scenes/levels/end.tscn")
