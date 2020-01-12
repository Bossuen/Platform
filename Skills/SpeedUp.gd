extends "res://BasicClass/Skill.gd"

func _ready():
	skill_name = "speed up"
	cost = 0
	cd = 3
	mode = MODE.SELF
	return

func activate(character):
	if can_use:
		can_use = false
		print("speed up")
		target = character
		target.move_speed *= 2 * level
		$active.start(3)
	else:
		print("not ready")
	
	return

func _on_active_timeout():
	print("speed down")
	target.move_speed /= 2 * level
	coolDown()
	return
