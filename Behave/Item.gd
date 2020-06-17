extends Node

# @@ virtual
func get_descriptor() -> int:
	# from right to left
	# 0: unique
	# 1: stackable (if unique then stackable must be 0)
	# 2: dropable
	# 3: trophyable
	# 4: holdable
	# 5: equipable
	# 6: costable
	# 7: expirable
	# 8: repaireable
	return 0b0_0000_0000

# @@ final
func is_unique() -> bool:
	return get_descriptor() & 0b0_0000_0001 == 1

# @@ final
func is_stackable() -> bool:
	return get_descriptor() & 0b0_0000_0010 == 1

# @@ final
func is_dropable() -> bool:
	return get_descriptor() & 0b0_0000_0100 == 1

# @@ final
func is_trophyable() -> bool:
	return get_descriptor() & 0b0_0000_1000 == 1

# @@ final
func is_holdable() -> bool:
	return get_descriptor() & 0b0_0001_0000 == 1

# @@ final
func is_equipable() -> bool:
	return get_descriptor() & 0b0_0010_0000 == 1

# @@ final
func is_costable() -> bool:
	return get_descriptor() & 0b0_0100_0000 == 1

# @@ final
func is_expireable() -> bool:
	return get_descriptor() & 0b0_1000_0000 == 1

# @@ final
func is_repaireable() -> bool:
	return get_descriptor() & 0b1_0000_0000 == 1

# @@ virtual
func get_type() -> String:
	return "Item"

# @@ virtual
func get_sub_type() -> String:
	return ""

# @@ final
# assume two item with identical id has same descriptor
func get_id() -> String:
	return get_type() + "-" + get_sub_type()

# @@ virtual
func stack(v) -> bool:
	return false

# @@ destack
func destack(remain: int):
	return null
