extends Node2D

var speed = 20
var top
var bottom

# Called when the node enters the scene tree for the first time.
func _ready():
	top = $bubbles1.position.y - $bubbles1.size.y
	bottom = $bubbles4.position.y
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$bubbles1.position.y -= speed * delta
	if $bubbles1.position.y <= top:
		$bubbles1.position.y = bottom
		
	$bubbles2.position.y -= speed * delta
	if $bubbles2.position.y <= top:
		$bubbles2.position.y = bottom
		
	$bubbles3.position.y -= speed * delta
	if $bubbles3.position.y <= top:
		$bubbles3.position.y = bottom
		
	$bubbles4.position.y -= speed * delta
	if $bubbles4.position.y <= top:
		$bubbles4.position.y = bottom
