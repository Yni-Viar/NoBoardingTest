extends Node3D

@export var game_data: GameData
@export var current_ambient: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	load_settings()
	load_save()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_save():
	#temporary
	var player: CharacterBody3D = ResourceLoader.load("res://FPSController/PlayerScene.tscn").instantiate()
	add_child(player)
	player.global_position = $entityspawn.global_position

func quit():
	Settings.first_start = true
	var loading_screen = load("res://Scenes/HubLoadingScreen.tscn")
	get_tree().change_scene_to_packed(loading_screen)

func set_background_music(to: String):
	if current_ambient != to:
		$AnimationPlayer.play("music_change")
		$BackgroundMusic.stream = load(to)
		$BackgroundMusic.playing = true
		$AnimationPlayer.play_backwards("music_change")
		current_ambient = to

func load_settings():
	$WorldEnvironment.environment.ssao_enabled = Settings.setting_res.ssao
	$WorldEnvironment.environment.ssil_enabled = Settings.setting_res.ssil
	$WorldEnvironment.environment.ssr_enabled = Settings.setting_res.ssr
	$WorldEnvironment.environment.glow_enabled = Settings.setting_res.glow
	if !Settings.setting_res.reflection_probes:
		for node in get_tree().get_nodes_in_group("reflection_probe"):
			if node is ReflectionProbe:
				node.hide()
	if !Settings.setting_res.dynamic_gi:
		for node in get_tree().get_nodes_in_group("voxelgi"):
			if node is VoxelGI:
				node.hide()
