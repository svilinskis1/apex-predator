extends ProgressBar

var drain_speed = .05

# Called when the node enters the scene tree for the first time.
func _ready():
	global.change_hunger.connect(on_hunger_changed)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value -= drain_speed

func on_hunger_changed(hunger):
	value += hunger
	$"../EatSoundPlayer".play()
