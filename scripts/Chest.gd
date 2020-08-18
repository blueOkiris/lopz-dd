extends StaticBody2D

var sprite : AnimatedSprite

var canOpen : bool = false
var id : String

func _ready():
	sprite = $Sprite
	sprite.animation = "closed"
	
	id = get_tree().get_current_scene().get_name() + " Chest"
	
	if not SceneChanger.chestIsOpens.has(id):
		SceneChanger.chestIsOpens[id] = false

func _process(_delta):
	if SceneChanger.chestIsOpens[id]:
		sprite.animation = "open"
	elif canOpen and Input.is_action_just_pressed("interact"):
		SceneChanger.chestIsOpens[id] = true
		canOpen = false

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		canOpen = true

func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		canOpen = false
