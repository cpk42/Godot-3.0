# Fireball physics
extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const FBSPD = 300
onready var counter = get_node("/root/World/Player")
var new = []

func _ready():
	set_process(true)
	
func _process(delta):
	var speed_x = 1
	var speed_y = 0
	var motion = Vector2(speed_x, speed_y) * FBSPD

	new.append(counter.flip)
	$AnimatedSprite.set_flip_h(new[0])
	if (self.position.x > 1034 || self.position.x < -10):
		self.queue_free()
	if (new[0]):
		self.position = self.position + motion * delta
	else:
		self.position = self.position - motion * delta
	
	


