extends Node2D

export(int) var monster_count = -1

var encounter = false
var current_target = 0

signal playerLeave
signal playerDead
signal playerStick
signal updateInfo

func _ready():
	$Test_Player.start($Start_point.position)
	emit_signal("updateInfo")
	return

func _process(delta):
	if monster_count == 0:
		get_tree().change_scene("res://Scene/Operation/Game_win.tscn")
	return

func _on_Test_Monster_area_entered(area):
	if area.state == $Test_Player.state:
		encounter = true
	return

func _on_Test_Monster_area_exited(area):
	if area.state == $Test_Player.state:
		encounter = false
		current_target = 0
		emit_signal("playerLeave")
	return

func _on_Test_Player_attack(damage):
	if encounter:
		current_target.hp -= damage
		print(current_target.hp)
		if current_target.hp <= 0:
			current_target.hide()
			current_target = 0
			encounter = false
			monster_count -= 1
			$Test_Player.money += 1000
			$Test_Player.initGlobal()
			emit_signal("updateInfo")
	return

func _on_Test_Monster_claimSelf(character):
	if character.hp > 0:
		current_target = character
	else:
		current_target = 0
		encounter = false
	return

func _on_monsterAttack_timeout():
	if encounter:
		$Test_Player.hp -= $monsterAttack.who.damage
		updateUser()
		emit_signal("playerStick")
		emit_signal("updateInfo")
		if $Test_Player.hp <= 0:
			emit_signal("playerDead")
			encounter = false
			current_target = 0
			User_Info.initUser()
	return

func _on_dead_timeout():
	get_tree().change_scene("res://Scene/Operation/Game_over.tscn")
	return

func updateUser():
	User_Info.user_name = $Test_Player.c_name
	User_Info.hp = $Test_Player.hp
	User_Info.mp = $Test_Player.mp
	User_Info.experience = $Test_Player.experience
	User_Info.level = $Test_Player.level
	User_Info.money = $Test_Player.money
	User_Info.damage = $Test_Player.damage
	return