extends Node

const  Concretness = preload("res://Behave/Concreteness.gd")
const  Soulness = preload("res://Behave/Soulness.gd")

var body = Concretness.new()
var soul = Soulness.new()

export (int) var init_strength = Concretness.DEFAULT_MIN_STRENGTH
export (int) var init_constitution = Concretness.DEFAULT_MIN_CONSTITUTION
export (int) var init_dexterity = Concretness.DEFAULT_MIN_DEXTERITY
export (int) var init_luck = Concretness.DEFAULT_MIN_LUCK
export (int) var init_intelligence = Soulness.DEFAULT_MIN_INTELLIGENCE
export (int) var init_wisdom = Soulness.DEFAULT_MIN_WISDOM
export (int) var init_charisma = Soulness.DEFAULT_MIN_CHARISMA

func _init():
	body.setup(init_strength, init_constitution, init_dexterity, init_luck, true)
	soul.setup(init_intelligence, init_wisdom, init_charisma, true)

func take_damage(damage_val: int, hp_damage: int, is_mortal: bool):
	pass
