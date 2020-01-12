extends Control

func _on_TextureButton_pressed():
	print("press")
	get_tree().change_scene("res://Scene/Operation/GetUserName.tscn")
	return