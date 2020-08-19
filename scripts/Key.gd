extends Storable

class_name Key

func _onTouch():
	PlayerUI.numKeys += 1
	._onTouch()
