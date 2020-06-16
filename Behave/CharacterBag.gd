# @@ final class
extends Node

const Item = preload("res://Behave/Item.gd")

var bag = []

func add_item(new_item: Item) -> void:
	bag.push_back(bag)


func drop_item(bag_hash: int, idx: int) -> bool:
	if bag.hash() != bag_hash:
		return false
	if idx > bag.size() - 1:
		return false
	bag[idx] = bag[bag.size() - 1]
	bag.pop_back()
	return true

func destack(bag_hash: int, idx: int, amount: int) -> bool:
	# TODO
	return true
	
func stack(bag_hash: int, idx1: int, idx2: int) -> bool:
	# TODO
	return true
