extends Node

# 1 because any soul has conscious
const DEFAULT_MIN_INTELLIGENCE = 1
# not like the intelligence inherit from gift, wisdom is getting from life.
# 0 because some soul is numb
const DEFAULT_MIN_WISDOM = 0
# 0 because some soul is numb
const DEFAULT_MIN_CHARISMA = 0

const DEFAULT_MIN_MAGIC = 0
# 0 because magic power need charge
const DEFAULT_INIT_MAGIC = 1


var m_magic = DEFAULT_INIT_MAGIC setget set_magic
var m_intelligence = DEFAULT_MIN_INTELLIGENCE setget set_intelligence
var m_wisdom = DEFAULT_MIN_WISDOM setget set_wisdom
var m_charisma = DEFAULT_MIN_CHARISMA setget set_charisma

func set_magic(val: int):
	if val < DEFAULT_MIN_MAGIC:
		m_magic = DEFAULT_MIN_MAGIC
		return
	var max_mp = get_max_mp()
	if val > max_mp:
		m_magic = max_mp
		return
	max_mp = m_magic
	
func set_intelligence(val: int):
	if val < DEFAULT_MIN_INTELLIGENCE:
		m_intelligence = DEFAULT_MIN_INTELLIGENCE
		return
	m_intelligence = val

func set_wisdom(val: int):
	if val < DEFAULT_MIN_WISDOM:
		m_wisdom = DEFAULT_MIN_WISDOM
		return
	m_wisdom = val

func set_charisma(val: int):
	if val < DEFAULT_MIN_CHARISMA:
		m_charisma = DEFAULT_MIN_CHARISMA
		return 
	m_charisma = val

func init_process():
	m_magic = get_max_mp()

func _init():
	init_process()

func setup(intelligence:int, wisdom: int, charisma: int, reinit: bool):
	m_intelligence = intelligence
	m_wisdom = wisdom
	m_charisma = charisma
	if reinit:
		init_process()

static func count_mp(intl: int, wis: int) -> int:
	var mp = (intl << 3) + (wis << 1)
	return mp

func get_max_mp() -> int:
	return count_mp(m_intelligence, m_wisdom)
	

