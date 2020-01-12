extends Node

var user_name
var hp
var mp
var experience
var level
var money
var damage

func _ready():
	initUser()
	return
	
func initUser():
	User_Info.user_name = "NULL"
	User_Info.hp = -1
	User_Info.mp = -1
	User_Info.experience = -1
	User_Info.level = -1
	User_Info.money = -1
	User_Info.damage = -1
	return