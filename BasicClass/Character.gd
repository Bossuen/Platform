extends Area2D

const STATE = {"NPC" : 0, "PLAYER" : 1, "MONSTER" : 2}
const EXP_LIMIT = 100

var c_name = "new character"
var hp = 0
var mp = 0
var level = 0
var experience = 0
var money = 0

var state = STATE.NPC
var backpack = { "items" : [], "capacity" : 10}

var damage = 0
var can_attack = true

func isUpgrade():
	if experience >= EXP_LIMIT:
		return true
	
	return false

func levelUp():
	level = level + int(experience/EXP_LIMIT)
	experience -= level * EXP_LIMIT
	return
	
func addItem(item):
	backpack.items.append(item)
	return

var motion = Vector2(0, 0)
export(int) var move_speed = 400
var screenSize

func fixPosition():
	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)
	return

func setScreen():
	screenSize = get_viewport_rect().size
	return