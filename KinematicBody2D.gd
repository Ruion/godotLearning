extends KinematicBody2D

export var speed = 150
export var jumpheight = -350
export var gravity = 10

const UP = Vector2(0, -1);
var motion = Vector2();

func _physics_process(delta):
	
	motion.y += gravity
	
	if(Input.is_action_pressed("ui_right")):
		motion.x = speed
	elif(Input.is_action_pressed("ui_left")):
		motion.x = -speed
	else:
		motion.x = 0
	
	if(is_on_floor()):
		if(Input.is_action_just_pressed("ui_up")):
			motion.y = jumpheight
			
	motion = move_and_slide(motion, UP);
		
	pass
