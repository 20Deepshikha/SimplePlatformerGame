extends KinematicBody2D


const WALK_SPEED = 300
const GRAVITY = 40
const JUMPFORCE = -900

var velocity = Vector2.ZERO
var coins = 0

func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		velocity.x = WALK_SPEED
		$AnimatedSprite.play('walk')
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed('ui_left'):
		velocity.x = -WALK_SPEED
		$AnimatedSprite.play('walk')
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play('idle')
	if not is_on_floor():
		$AnimatedSprite.play('jump')
	velocity.y += GRAVITY
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	# friction with lerp, because am lazy
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	#if coins == 3:
		#get_tree().chage_scene("res://world.gd")

func bounce():
	velocity.y = 0.5 * JUMPFORCE
	
#func add_coin():
	#coins = coins + 1
	#print("I now have this many coins: ", coins)

