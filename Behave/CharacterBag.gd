# @@ final class
extends Node

const Item = preload("res://Behave/Item.gd")

var bag = []
var bag_limit = 0 setget set_bag_limit

func set_bag_limit(val:int):
	bag_limit = val

func is_full() -> bool:
	for i in range(bag.size()):
		var item = bag[i] as Item
		if item == null:
			return false
	# reach here means no gap space, try look at limit
	if bag.size() < bag_limit:
		return false
	return true

func add_item(new_item: Item) -> bool:
	# TODO: auto stack
	for i in range(bag.size()):
		var item = bag[i] as Item
		if item == null:
			bag[i] == new_item
			return true
	if bag.size() < bag_limit:
		bag.push_back(new_item)
		return true
	return false

func drop_item(idx: int) -> bool:
	if idx >= bag.size():
		return false
	bag[idx] = null
	return true

func destack(idx: int, remain: int) -> bool:
	if idx >= bag.size():
		return false
	var item = bag[idx] as Item
	if item == null:
		return false
	if !item.is_stackable():
		return false
	if is_full():
		return false
	var new_item = item.destack(remain)
	if new_item == null:
		return false
	add_item(new_item)
	return true
	
# merge idx2 into idx1
func stack(idx1: int, idx2: int) -> bool:
	var item1 = bag[idx1] as Item
	if item1 == null || !item1.is_stackable():
		return false
	var item2 = bag[idx2] as Item
	if item2 == null || !item2.is_stackable():
		return false
	if item1.get_id() != item2.get_id():
		return false
	var stack_result = item1.stack(item2)
	if !stack_result:
		return false
	bag[idx2] = null
	return true
