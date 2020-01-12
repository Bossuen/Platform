extends "res://BasicClass/Skill.gd"

func _ready():
	skill_name = "Attack up"
	cost = 0
	cd = 5
	mode = MODE.SELF
	return

func activate(character):
	if can_use:
		can_use = false
		print("ATK UP")
		target = character
		target.damage *= 2 * level
		$active.start(5)
	else:
		print("not ready")
	
	return

func _on_active_timeout():
	print("ATK down")
	target.damage /= 2 * level
	coolDown()
	return
