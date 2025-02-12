extends Path3D

@export var enemy_scene: PackedScene

func spawn_enemy() -> void:
	#Connected to Timer
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)
