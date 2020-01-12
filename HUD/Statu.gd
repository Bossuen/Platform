extends Container


func setInfo():
	$name.text = User_Info.user_name
	$VBoxContainer/hp.text = str(User_Info.hp)
	$VBoxContainer/mp.text = str(User_Info.mp)
	$VBoxContainer/atk.text = str(User_Info.damage)
	$VBoxContainer/def.text = "ZERO"
	$VBoxContainer/coin.text = str(User_Info.money)
	$VBoxContainer/experience.text = str(User_Info.experience)
	
	

func _on_Name_pressed():
	visible = not visible
	return

func _on_Button_pressed():
	visible = false
	return

func _on_HUD_updateInfo():
#	setInfo()
	return