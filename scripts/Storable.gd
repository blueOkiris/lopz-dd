extends Area2D

class_name Storable

export(String) var id = 'storable'

func _ready():
	if not SceneChanger.storables.has(id):
		SceneChanger.storables[id] = false
	elif SceneChanger.storables[id]:
		queue_free()
	
	connect('body_entered', self, '_touched')
	
func _onTouch():
	queue_free()

func _touched(body):
	if body.get_name() == 'Player':
		SceneChanger.storables[id] = true
		_onTouch()
