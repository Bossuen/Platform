extends "res://BasicClass/Character.gd"

var move_range
var direction 
export(int) var sca = 10

signal claimSelf(character)
signal prepareAttack(character)

func _ready():
	hp = 100
	mp = 0
	c_name = "RBQ"
	state = STATE.MONSTER
	
	damage = 50
	
	$Body.animation = "idle"
	randomize()
	setScreen()
	return

func generateRand():
	move_range = sca * (randi() % 2)
	direction = 1 - 2 * (randi() % 2)
	return

func _on_monsterMove_timeout():
	generateRand()
	motion.x = direction * move_range
	generateRand()
	motion.y = direction * move_range
	
	motion = motion.normalized() * move_speed

	return

func _process(delta):
	position += motion * delta
	fixPosition()
	return

func _on_Test_Monster_area_entered(area):
	emit_signal("claimSelf", self)
	emit_signal("prepareAttack", self)
	return