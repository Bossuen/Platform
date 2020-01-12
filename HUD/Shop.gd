extends Container.

signal unlock1(money)
signal unlock2(money)
signal unlock3(money)




func _ready():
	pass

func _on_Button2_pressed():
	visible = not visible
	return

func _on_Button_pressed():
	visible = false
	return

func _on_speed_pressed():
	emit_signal("unlock1",10000)
	

func _on_att_pressed():
	emit_signal("unlock2",10000)

func _on_chun_pressed():
	emit_signal("unlock3",10000)
