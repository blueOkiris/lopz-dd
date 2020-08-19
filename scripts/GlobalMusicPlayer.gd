extends AudioStreamPlayer

var startTitleMusic : bool = false
var titleMusic : AudioStream = load('res://audio/link-awak-title-child-ver.wav')

func _process(_delta):	
	var sceneName = get_tree().get_current_scene().get_name()
	
	if sceneName == 'Main Menu' \
	or sceneName == 'Level Editor' \
	or sceneName == 'Level Select':
		if not startTitleMusic:
			startTitleMusic = true
			stream = titleMusic
			seek(0)
			play()
	else:
		if startTitleMusic:
			startTitleMusic = false
			stop()
