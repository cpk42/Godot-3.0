extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var motion = Vector2()
const JUMP = -550
const GRAVITY = 30
const UP = Vector2(0, -1)
const FIRE = "magewindup"
const WALK = "magewalk"
var anim = FIRE
const spd = 200
const FIREBALL_SCENE = preload("Fireball.tscn")
var flip = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$mage.play(WALK)
		flip = true
		$mage.set_flip_h(flip)
		motion.x = spd
	elif Input.is_action_pressed("ui_left"):
		$mage.play(WALK)
		flip = false
		$mage.set_flip_h(flip)
		motion.x = -spd
	elif Input.is_action_pressed("ui_select"):
		motion.x = 0
		$mage.play(FIRE)
		if $mage.get_frame() == 10:
			var fireball = FIREBALL_SCENE.instance()
			get_parent().add_child(fireball)
			if (flip):
				fireball.set_position(get_node("Position2D").get_global_position())
			else:
				var pos = Vector2(get_node("Position2D").get_global_position().x - 85, get_node("Position2D").get_global_position().y)
				fireball.set_position(pos)
		
			
	else:
		motion.x = 0
		$mage.play("mageidle")


	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
	else:
		motion.y += GRAVITY
		
	if is_on_wall():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
	move_and_slide(motion, UP)
	pass
