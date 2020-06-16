# @@ final class
extends Node

# 0 because something can't move
const DEFAULT_MIN_STRENGTH = 0
# 1 because anything must has hp
const DEFAULT_MIN_CONSTITUTION = 1
# 0 because something can't move
const DEFAULT_MIN_DEXTERITY = 0
# 0 because something can't move
const DEFAULT_MIN_LUCK = 0

const DEFAULT_MIN_HEALTH = 0
# 1 because inital state is alive
const DEFAULT_INIT_HEALTH = 1


var m_health  = DEFAULT_INIT_HEALTH setget set_health
var m_strength = DEFAULT_MIN_STRENGTH setget set_strength
var m_constitution = DEFAULT_MIN_CONSTITUTION setget set_constitution
var m_dexterity = DEFAULT_MIN_DEXTERITY setget set_dexterity
var m_luck = DEFAULT_MIN_LUCK setget set_luck

func set_health(val: int):
	if val < DEFAULT_MIN_HEALTH:
		m_health = DEFAULT_MIN_HEALTH
		return
	var max_hp = get_max_hp()
	if val > max_hp:
		m_health = max_hp
		return
	m_health = val

func set_strength(val: int):
	if val < DEFAULT_MIN_CONSTITUTION:
		m_strength = DEFAULT_MIN_CONSTITUTION
		return
	m_strength = val

func set_constitution(val: int):
	if val < DEFAULT_MIN_CONSTITUTION:
		m_constitution = DEFAULT_MIN_CONSTITUTION
		return
	m_constitution = val
	
func set_dexterity(val: int):
	if val < DEFAULT_MIN_DEXTERITY:
		m_dexterity = DEFAULT_MIN_DEXTERITY
		return
	m_dexterity = val
	
func set_luck(val: int):
	if val < DEFAULT_MIN_LUCK:
		m_luck = DEFAULT_MIN_LUCK
		return
	m_luck	= val

func init_process():
	m_health = get_max_hp()

func _init():
	init_process()
	

func setup(strength:int, constitution:int, dexterity:int, luck:int, reinit: bool):
	m_strength = strength
	m_constitution = constitution
	m_dexterity = dexterity
	m_luck = luck
	if reinit:
		init_process()

static func count_hp(con: int) -> int:
	var hp = con << 3
	return hp

func get_max_hp() -> int:
	return count_hp(m_constitution)

