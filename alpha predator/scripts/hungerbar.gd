extends ProgressBar

var drain_speed = .07

# Called when the node enters the scene tree for the first time.
func _ready():
	global.change_hunger.connect(on_hunger_changed)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"..".visible:
		value -= drain_speed
		if value <= 45 :
			$"../AnimationPlayer".play("flash")
		
		if value <= 20 and not $"../AlarmSoundPlayer".playing:
				$"../AlarmSoundPlayer".playing = true
		elif value > 20:
			$"../AlarmSoundPlayer".playing = false
			
	if not $"..".visible:
		$"../AlarmSoundPlayer".playing = false

func on_hunger_changed(hunger):
	value += hunger
	$"../EatSoundPlayer".play()
