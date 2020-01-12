extends GridContainer
class_name Inventory
const Item = preload("res://data/item/Item.gd");
const ItemSlot = preload("res://data/Inventory/ItemSlot.gd");

const slotTexture = preload("res://data/graphics/itemSlot.png");
const itemImages = [
	preload("res://data/graphics/armor.png"),
	preload("res://data/graphics/weapon.png"),
	preload("res://data/graphics/item.png")

]; # item art
const itemDictionary = { # Placeholders
	0: {
		"type": "armor",
		"name": "Sample Armor",
		"value": 100,
		"icon": itemImages[0],
		"defense": 5
	}, 1: {
		"type": "weapon",
		"name": "Sample Weapon",
		"value": 100,
		"icon": itemImages[1],
		"damage": 5
	}, 2: {
		"type": "item",
		"name": "Sample Item",
		"value": 100,
		"icon": itemImages[2]
	}
};

var slots = Array();
var items = Array();
var capacity: int = 20;
var holdingItem = null;

func _ready():
	for item in itemDictionary:
		if itemDictionary[item].type == "item":
			items.append(Item.new(itemDictionary[item].name, itemDictionary[item].icon, itemDictionary[item].value));
		elif itemDictionary[item].type == "armor":
			items.append(Item.new(itemDictionary[item].name, itemDictionary[item].icon, itemDictionary[item].value, itemDictionary[item].defense));
		elif itemDictionary[item].type == "weapon":
			items.append(Item.new(itemDictionary[item].name, itemDictionary[item].icon, itemDictionary[item].value, itemDictionary[item].damage));
	
	for i in range(capacity):
		var slot = ItemSlot.new(i);
		slots.append(slot);
		add_child(slot);
	
	slots[0].setItem(items[0]);
	slots[1].setItem(items[1]);
	slots[2].setItem(items[2]);

func _input(event):
	if holdingItem != null && holdingItem.picked:
		holdingItem.rect_global_position = Vector2(event.position.x, event.position.y);

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var clickedSlot;
		for slot in slots:
			if (slot.get_local_mouse_position().x >= 0 && slot.get_local_mouse_position().x <= slot.texture.get_width() && slot.get_local_mouse_position().y >= 0 && slot.get_local_mouse_position().y <= slot.texture.get_height();):
				clickedSlot = slot;
		if holdingItem != null:
			if clickedSlot.item != null:
				var tempItem = clickedSlot.item;
				var oldSlot = slots[slots.find(holdingItem.itemSlot)];
				clickedSlot.pickItem();
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
				oldSlot.putItem(tempItem);
			else:
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
		elif clickedSlot.item != null:
			holdingItem = clickedSlot.item;
			clickedSlot.pickItem();
			holdingItem.rect_global_position = Vector2(event.position.x, event.position.y);