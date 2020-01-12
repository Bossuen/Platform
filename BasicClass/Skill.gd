extends Node2D

const MODE = { "SELF" : 0, "OTHER" : 1, "AOE" : 2, "AOE_SELF" : 3}

var skill_name = "skill"
var cost = 0
var cd = 0
var level = 1

var mode = MODE.AOE
var target

var can_use = true

signal cd
signal cd_done

func coolDown():
	$cd.start(cd)
	can_use = false
	emit_signal("cd")
	return

func _on_cd_timeout():
	can_use = true
	print(skill_name + " ready")
	emit_signal("cd_done")
	return