extends CanvasLayer

var playerHealth : float = 4
var width = 0
var numKeys : int = 0

var hearts : Sprite
var keySpr : Sprite
var keyText : Label

func _ready():
	hearts = $Hearts
	keySpr = $KeySpr
	keyText = $Keys
	width = hearts.region_rect.size.x
	
func hideUIInCorrectRoom():
	var sceneName = get_tree().get_current_scene().get_name()
	if sceneName == 'Level Editor' \
	or sceneName == 'Level Select' \
	or sceneName == 'Main Menu':
		hearts.visible = false
		keySpr.visible = false
		keyText.visible = false
	else:
		hearts.visible = true
		keySpr.visible = true
		keyText.visible = true
		
func updateHealth():
	hearts.region_rect.size.x = width * (playerHealth / 4)

func updateKeyText():
	keyText.text = str(numKeys)

func _process(_delta):
	hideUIInCorrectRoom()
	updateHealth()
	updateKeyText()
