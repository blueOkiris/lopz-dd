extends StaticBody2D

class_name Chest

export(String) var id = 'chest'
export(String) var storableType = 'storable'

var sprite : AnimatedSprite

var canOpen : bool = false
var alreadyOpen : bool = false

func _ready():
	sprite = $Sprite
	sprite.animation = 'closed'
	
	if not SceneChanger.chestIsOpens.has(id):
		SceneChanger.chestIsOpens[id] = false
	elif SceneChanger.chestIsOpens[id]:
		alreadyOpen = true;
		sprite.animation = 'alreadyOpen'

func touchStorable():
	if storableType == 'key':
		var newKey = Key.new()		
		newKey.id = id + '_key'
		newKey._ready()
		newKey._onTouch()
		newKey.queue_free()

func _process(_delta):
	if alreadyOpen:
		sprite.animation = 'alreadyOpen'
	elif SceneChanger.chestIsOpens[id]:
		sprite.animation = 'open'
		touchStorable()
		alreadyOpen = true
	elif canOpen and Input.is_action_just_pressed('interact'):
		SceneChanger.chestIsOpens[id] = true
		canOpen = false

func _on_Area2D_body_entered(body):
	if body.get_name() == 'Player':
		canOpen = true

func _on_Area2D_body_exited(body):
	if body.get_name() == 'Player':
		canOpen = false
