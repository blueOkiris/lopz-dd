extends Door

var collider : StaticBody2D
var sprite : AnimatedSprite

var canOpen : bool = false

func _ready():
	collider = $Collider
	sprite = $Sprite
	
	if not SceneChanger.doors.has(id):
		SceneChanger.doors[id] = false
	elif SceneChanger.doors[id]:
		collider.queue_free()
	
func _process(_delta):
	if SceneChanger.doors[id]:
		sprite.animation = 'unlocked'
	elif canOpen \
	and Input.is_action_pressed('interact') \
	and PlayerUI.numKeys > 0:
		SceneChanger.doors[id] = true
		sprite.animation = 'unlocked'
		collider.queue_free()
		
		PlayerUI.numKeys -= 1
	else:
		sprite.animation = 'locked'

func _on_LockedDoor_body_entered(body):
	if body.get_name() == 'Player':
		canOpen = true


func _on_LockedDoorUp_body_exited(body):
	if body.get_name() == 'Player':
		canOpen = false
