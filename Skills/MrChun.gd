extends "res://BasicClass/Skill.gd"

signal update

func _ready():
	skill_name = "Brother Chun back to life"
	cost = 0
	cd = 5
	mode = MODE.SELF
	return

func activate(character):
	if can_use:
		can_use = false
		print("Chun UP")
		target = character
		$active.start(1)
	else:
		print("not ready")
	
	return

func _on_active_timeout():
	print("Chun down")
	target.hp += 30 * level
	emit_signal("update")
	coolDown()
	return
