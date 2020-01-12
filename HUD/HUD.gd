extends CanvasLayer

func setInfo():
	$Name.text = User_Info.user_name
	$HP.text = "HP: " + str(User_Info.hp)
	$MP.text = "MP: " + str(User_Info.mp)
	
	$STATU.visible = false
	$STATU.setInfo()
	
	return

func _on_Level0_updateInfo():
	setInfo()
	return


func _on_HUD_ready():
	$cool1.visible = false
	$cool2.visible = false
	$cool3.visible = false
	$map.visible = false
	$Shop.visible = false
	
	$skill1.visible = false
	$skill2.visible = false
	$skill3.visible = false
	return

func _on_Test_Player_cd_done_1():
	$cool1.visible = false
	return


func _on_Test_Player_cd_2():
	$cool2.visible = true
	return


func _on_Test_Player_cd_1():
	$cool1.visible = true
	return


func _on_Test_Player_cd_done_2():
	$cool2.visible = false
	return


func _on_Test_Player_cd_3():
	$cool3.visible = true
	return

func _on_Test_Player_cd_done_3():
	$cool3.visible = false
	return


func _on_Test_Player_updateInfo():
	setInfo()
	return


func _on_Button_pressed():
	$map.visible = not $map.visible
	return

signal skill_1(money)
signal skill_2(money)
signal skill_3(money)

func _on_Shop_unlock1(money):
	emit_signal("skill_1", money)
	return


func _on_Shop_unlock2(money):
	emit_signal("skill_2", money)
	return


func _on_Shop_unlock3(money):
	emit_signal("skill_3", money)
	return
