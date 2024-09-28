extends Node3D

@export var no_boarding_light_enable: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func control_lights(on: bool) -> void:
	var material: StandardMaterial3D = load("res://Assets/Materials/posadkinet.tres")
	if on:
		material.emission_energy_multiplier = 1.0
	else:
		material.emission_energy_multiplier = 0.0
	$Cube_004.set_surface_override_material(0, material)


func _on_timer_timeout() -> void:
	if no_boarding_light_enable:
		control_lights(true)
		no_boarding_light_enable = false
	else:
		control_lights(false)
		no_boarding_light_enable = true
	$Timer.start()
