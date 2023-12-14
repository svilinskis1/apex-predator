#controls the hunger bar
extends ProgressBar

var drain_speed = .07

func _ready():
	global.change_hunger.connect(on_hunger_changed)
	pass

func _process(delta):
	if $"..".visible: #if the hunger bar is active
		value -= drain_speed #then drain it
		if value <= 45 : #flash when it gets low
			$"../AnimationPlayer".play("flash")
		
		#when it gets even lower play an alarm
		if value <= 20 and not $"../AlarmSoundPlayer".playing:
				$"../AlarmSoundPlayer".playing = true
		elif value > 20:
			$"../AlarmSoundPlayer".playing = false
			
	if not $"..".visible:
		$"../AlarmSoundPlayer".playing = false

#increases the hunger bar by incoming value
func on_hunger_changed(hunger):
	value += hunger
	$"../EatSoundPlayer".play()
