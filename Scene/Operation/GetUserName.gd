extends Control


var player_name = ""

func _on_LineEdit_text_changed(new_text):
	if new_text != null:
		player_name = new_text
	
func _on_First_pressed():
	$Label.text = "Hello %s, START?"%(player_name)
	$First.visible = false
	$Second.visible = true
	
func _on_GetUserName_ready():
	$Second.visible = false


func _on_Second_pressed():
	User_Info.user_name = player_name
	get_tree().change_scene("res://Scene/Levels/Level0.tscn")
	pass