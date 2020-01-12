extends TextureRect;

var index: int; # slot index
var item: Item = null; # item in slot

func _init(index):
	self.index = index;
	self.name = "ItemSlot_%d" % index;
	texture = preload("res://data/graphics/itemSlot.png");
	mouse_filter = Control.MOUSE_FILTER_PASS;
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND;

func setItem(item):
	add_child(item);
	self.item = item;

func pickItem():
	self.item.pick();
	remove_child(self.item);
	get_parent().get_parent().add_child(self.item);
	self.item = null;

func putItem(item):
	self.item = item;
	self.item.putItem();
	get_parent().get_parent().remove_child(self.item);
	add_child(self.item);