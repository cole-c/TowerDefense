extends MarginContainer

@onready var label: Label = $Label

@export var starting_gold := 150

var gold: int:
	set(gold_in):
		gold = max(gold_in, 0)
		label.text = "Gold: " + str(gold)

func _ready() -> void:
	gold = starting_gold
