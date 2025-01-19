extends PathFollow3D

@export var speed = 2.5

@onready var base = get_tree().get_first_node_in_group("Base")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Adding delta will move at 1 m/s
	progress += speed * delta;
	if(progress_ratio == 1.0):
		base.take_damage()
		set_process(false)
