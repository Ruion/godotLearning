extends KinematicBody2D

export var max_speed = 200
export var jumpheight = -350
export var gravity = 10
export var acceleration = 40

var sprite

func _ready():
	sprite = get_node("Sprite")
	pass

const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false;
	
	if(Input.is_action_pressed("ui_right")):
		motion.x = min(motion.x+acceleration, max_speed)
		sprite.flip_h = false
		sprite.play("Run")
	elif(Input.is_action_pressed("ui_left")):
		motion.x = max(motion.x-acceleration, -max_speed)
		sprite.flip_h = true
		sprite.play("Run")
	else:
		motion.x = 0
		sprite.play("Idle")
		friction = true;
	
	if(is_on_floor()):
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jumpheight
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			sprite.play("Jump")
		else:
			sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
				
	motion = move_and_slide(motion, UP);
		
	pass
