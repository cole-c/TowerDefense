extends CanvasLayer

@onready var star_1: TextureRect = %Star1
@onready var star_2: TextureRect = %Star2
@onready var star_3: TextureRect = %Star3

@onready var health_label: Label = %HealthLabel
@onready var gold_label: Label = %GoldLabel

@onready var base = get_tree().get_first_node_in_group("Base")
@onready var bank = get_tree().get_first_node_in_group("Bank")

func victory() -> void:
	visible = true
	if base.max_health == base.current_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
	else: 
		star_2.modulate = Color(0.148, 0.148, 0.148)
		health_label.visible = false
	if(bank.gold > 500):
		star_3.modulate = Color.WHITE
		gold_label.visible = true
	else:
		star_3.modulate = Color(0.148, 0.148, 0.148)
		gold_label.visible = false

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
