extends Timer

var who = 0
var has_member = false

func _on_Test_Monster_prepareAttack(character):
	if not has_member:
		who = character
		start()
	return

func _on_Level0_playerLeave():
	who = 0
	has_member = false
	return
