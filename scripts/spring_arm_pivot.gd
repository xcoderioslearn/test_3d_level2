extends Node3D

@export var mouse_sensibility: float = 0.001
@export_range(-90.0, 0.0, 0.1, "radians_as_degrees") var min_vertical_angle: float = deg_to_rad(-90.0)
@export_range(0.0, 90.0, 0.1, "radians_as_degrees") var max_vertical_angle: float = deg_to_rad(45.0)

@export var min_spring_length: float = 1.0
@export var max_spring_length: float = 4.0

@onready var spring_arm := $SpringArm3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:


		rotation.x -= event.relative.y * mouse_sensibility
		rotation.x = clamp(rotation.x, min_vertical_angle, max_vertical_angle)
	

	if event.is_action_pressed("wheel_up"):
		spring_arm.spring_length = clamp(spring_arm.spring_length - 1, min_spring_length, max_spring_length)

	if event.is_action_pressed("wheel_down"):
		spring_arm.spring_length = clamp(spring_arm.spring_length + 1, min_spring_length, max_spring_length)

	if event.is_action_pressed("toggle_mouse_capture"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
