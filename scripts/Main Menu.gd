extends CanvasLayer

var playBtnRef : Button
var createBtnRef : Button

func _ready():
	playBtnRef = $PlayButton
	createBtnRef = $CreateButton

func _on_PlayButton_pressed():
	self.layer = 0
	playBtnRef.disabled = true
	createBtnRef.disabled = true
	
	SceneChanger.changeScene('res://scenes/Level Select.tscn', 0)

func _on_CreateButton_pressed():
	self.layer = 0
	playBtnRef.disabled = true
	createBtnRef.disabled = true
	
	SceneChanger.changeScene('res://scenes/Level Editor.tscn', 0)
