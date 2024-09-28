extends PathFollow3D
class_name PathWalker

@export var speed = 0.005
@export var enable_interact: bool = true
var enabled: bool = true
var transition: bool = false
var counter: int = 1

# Called when the node enters the scene tree for the first time.
#func _ready():
	#if Settings.setting_res.game_optimizator <= 0:
		#set_process(false)
		#set_physics_process(false)

func interact():
	if enable_interact:
		transition = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if enabled:
		progress_ratio -= speed * delta
