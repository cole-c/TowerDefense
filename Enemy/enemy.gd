extends PathFollow3D

@export var speed = 2.5
@export var max_health = 50
@export var gold_on_kill := 15

@onready var base = get_tree().get_first_node_in_group("Base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("Bank")

var current_health: int:
	set(health_in):
		if(health_in < current_health):
			animation_player.play("TakeDamage")
		current_health = health_in
		if current_health < 1:
			bank.gold += gold_on_kill
			queue_free()

func _ready() -> void:
	current_health = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Adding delta will move at 1 m/s
	progress += speed * delta;
	if(progress_ratio == 1.0):
		base.take_damage()
		set_process(false)
		queue_free()
