extends Timer

func _on_Test_Player_attack(damage):
	get_parent().can_attack = false
	start()
	return

