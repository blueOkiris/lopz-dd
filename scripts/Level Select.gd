extends CanvasLayer

var testLvlBtnRef : Button

func _ready():
	testLvlBtnRef = $TestLevel

func _on_TestLevel_pressed():
	self.layer = 0
	testLvlBtnRef.disabled = true
	
	SceneChanger.changeScene('res://scenes/Test Level.tscn', 0)
