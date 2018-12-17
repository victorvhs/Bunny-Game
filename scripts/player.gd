extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1750

export var world_limit = 2000
var motion = Vector2()

func _ready():
	Global.Player = self
	
func _physics_process(delta):
	update_motion(delta)
	
func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion,UP)

func _process(delta):
	update_animation(motion)
	
func update_animation(motion):
	$AnimatedSprite.update(motion)
	
func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta	
	if position.y > world_limit:
		Global.GameState.end_game()

func jump():
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y = JUMP_SPEED
		
func hurtJump():
	motion.y = JUMP_SPEED

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0