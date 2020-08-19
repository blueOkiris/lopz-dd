extends KinematicBody2D

var sprite : AnimatedSprite
var collider : CollisionShape2D

var vel : Vector2 = Vector2(0, 0)
var moveSpeed : int = 350
var lastDir : int = 0

func _ready():
	set_position(SceneChanger.playerPos)
	lastDir = SceneChanger.playerDir
	
	sprite = $Sprite
	collider = $Collider

func updateSpeed():
	vel = Vector2(0, 0)
	if Input.is_action_pressed('move_link_up'):
		vel.y -= moveSpeed
	#
	if Input.is_action_pressed('move_link_down'):
		vel.y += moveSpeed
	#
	if Input.is_action_pressed('move_link_left'):
		vel.x -= moveSpeed
	#
	if Input.is_action_pressed('move_link_right'):
		vel.x += moveSpeed
		
func updateAnimation():	
	if vel.x > 0:
		sprite.animation = 'walkRight'
		lastDir = 0
	elif vel.x < 0:
		sprite.animation = 'walkLeft'
		lastDir = 2
	elif vel.y > 0:
		sprite.animation = 'walkDown'
		lastDir = 1
	elif vel.y < 0:
		sprite.animation = 'walkUp'
		lastDir = 3
		
	if vel.x == 0 and vel.y == 0:
		if lastDir == 0:
			sprite.animation = 'standRight'
		elif lastDir == 1:
			sprite.animation = 'standDown'
		elif lastDir == 2:
			sprite.animation = 'standLeft'
		elif lastDir == 3:
			sprite.animation = 'standUp'

func _physics_process(_delta):
	updateSpeed()
	vel = move_and_slide(vel)
	
	updateAnimation()
