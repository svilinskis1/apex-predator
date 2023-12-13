#script to animate the bubbles
extends Node2D

var speed = 20
var top
var bottom

func _ready():
	#set the initial position of the bubbles
	top = $bubbles1.position.y - $bubbles1.size.y
	bottom = $bubbles3.position.y

#move the bubbles every frame
#when the top bubble gets high enough it goes to the bottom
#so they loop 
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
