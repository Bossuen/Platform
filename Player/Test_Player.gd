extends "res://BasicClass/Character.gd"

signal attack(damage)
signal hit

signal cd_1
signal cd_done_1
signal cd_2
signal cd_done_2
signal cd_3
signal cd_done_3

signal updateInfo

var dead = false
var stick = false

var skill_1 = false
var skill_2 = false
var skill_3 = false

func _ready():
	hp = 100
	mp = 100
	money = 10000000000
	level = 100
	if User_Info.user_name == "":
		User_Info.user_name = "D Class"
	c_name = User_Info.user_name
	
	initGlobal()
	
	state = STATE.PLAYER
	setScreen()
	
	damage = 40
	User_Info.damage = damage
	return

func initGlobal():
	User_Info.hp = hp
	User_Info.mp = mp
	User_Info.money = money
	User_Info.level = level
	return

func start(pos):
	position = pos
	$Physic.disabled = false
	return

func _process(delta):
	if not (dead or stick):
		if Input.is_action_pressed("move_up"):
			motion.y = -1
		elif Input.is_action_pressed("move_down"):
			motion.y = 1
		else:
			motion.y = 0
		
		if Input.is_action_pressed("move_left"):
			$Body.flip_h = true
			$shadow.flip_h = true
			motion.x = -1
		elif Input.is_action_pressed("move_right"):
			$Body.flip_h = false
			$shadow.flip_h = false
			motion.x = 1
		else:
			motion.x = 0
		
		if Input.is_action_just_pressed("skill_1") and skill_1:
			$SpeedUp.activate(self)
		
		if Input.is_action_just_pressed("skill_2") and skill_2:
			$ATTUP.activate(self)
		
		if Input.is_action_just_pressed("skill_3") and skill_3:
			$MrChun.activate(self)
		
		if Input.is_action_pressed("attack"):
			if can_attack:
				$Body.play("attack")
				emit_signal("attack", damage)
		elif motion.length() > 0:
			motion = motion.normalized() * move_speed
			$Body.play("run")
		else:
			$Body.play("idle")
		
		position += motion * delta
		fixPosition()
	return

func _on_attack_frequency_timeout():
	can_attack = true
	return

func _on_Level0_playerDead():
	dead = true
	$Body.play("dead")
	return

func _on_Level0_playerStick():
	if not stick:
		stick = true
		$Body.play("hit")
		emit_signal("hit")
	return


func _on_stick_timeout():
	stick = false
	return


func _on_SpeedUp_cd():
	emit_signal("cd_1")
	return


func _on_SpeedUp_cd_done():
	emit_signal("cd_done_1")
	return


func _on_ATTUP_cd():
	emit_signal("cd_2")
	return

func _on_ATTUP_cd_done():
	emit_signal("cd_done_2")
	return


func _on_MrChun_cd():
	emit_signal("cd_3")
	return


func _on_MrChun_cd_done():
	emit_signal("cd_done_3")
	return


func _on_MrChun_update():
	initGlobal()
	emit_signal("updateInfo")
	return


func _on_HUD_skill_1(money):
	if self.money < money:
		return
	
	self.money -= money
	if not skill_1:
		skill_1 = true
		$Camera2D/HUD/skill1.visible = true
	else:
		$SpeedUp.level += 1
	
	initGlobal()
	emit_signal("updateInfo")
	return


func _on_HUD_skill_2(money):
	if self.money < money:
		return
	
	self.money -= money
	if not skill_2:
		skill_2 = true
		$Camera2D/HUD/skill2.visible = true
	else:
		$ATTUP.level += 1
	
	initGlobal()
	emit_signal("updateInfo")
	return


func _on_HUD_skill_3(money):
	if self.money < money:
		return
	
	self.money -= money
	if not skill_3:
		skill_3 = true
		$Camera2D/HUD/skill3.visible = true
	else:
		$MrChun.level += 1
	
	initGlobal()
	emit_signal("updateInfo")
	return
