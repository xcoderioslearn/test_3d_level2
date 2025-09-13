extends Camera3D


@export var spring_arm: Node3D
@export var lerp_power: float = 20.0


func _process(delta: float) -> void:
	global_position = global_position.lerp(spring_arm.global_position, delta * lerp_power)
	global_rotation = global_rotation.lerp(spring_arm.global_rotation, delta * lerp_power)
