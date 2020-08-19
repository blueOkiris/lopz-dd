extends CanvasLayer

signal scene_changed()

var animation : AnimationPlayer
var black : ColorRect

var playerPos : Vector2 = Vector2(448, 256)
var playerDir : int = 1
var chestIsOpens = {}

func _ready():
	animation = $AnimationPlayer
	black = $Control/Black

func _process(_delta):
	if Input.is_action_pressed("quit_game"):
		get_tree().quit()

func changeScene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animation.play("fade")
	yield(animation, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	animation.play_backwards("fade")
	yield(animation, "animation_finished")
	emit_signal("scene_changed")

func _on_Left_body_entered(body):
	if body.get_name() == "Player":
		playerPos.x = 1920 - 128
		playerPos.y = body.get_position().y
		playerDir = 2
		
		if get_tree().get_current_scene().get_name() == "Test Level 2":
			changeScene("res://scenes/Test Level.tscn", 0)

func _on_Right_body_entered(body):
	if body.get_name() == "Player":
		playerPos.x = 128
		playerPos.y = body.get_position().y
		playerDir = 0
		
		if get_tree().get_current_scene().get_name() == "Test Level":
			changeScene("res://scenes/Test Level 2.tscn", 0)

func _on_Top_body_entered(body):
	pass

func _on_Bottom_body_entered(body):
	pass
