extends Node

@export var game_length := 180.0
@export var spawn_time_curve: Curve
@export var enemy_health_curve: Curve
@export var game_speed := 1

@onready var timer: Timer = $Timer

signal stop_spawning_enemies

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(game_length)
	Engine.time_scale = game_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(get_spawn_time())
	pass

# return % of level progress, from 0.0 to 1.0
func game_progress_ratio() -> float: 
	return 1.0 - (timer.time_left/game_length)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())

func get_spawn_health() -> float: 
	return enemy_health_curve.sample(game_progress_ratio())

func _on_timer_timeout() -> void:
	stop_spawning_enemies.emit()
