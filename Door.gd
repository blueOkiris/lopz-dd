extends Area2D

class_name Door

export(String) var type = 'normal'
export(String) var id = 'door'

func _ready():
	if not SceneChanger.doors.has(id):
		SceneChanger.doors[id] = false
