extends Control

@export var path: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request(path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress: Array
	var status = ResourceLoader.load_threaded_get_status(path, progress)
	if status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		$ProgressBar.value = progress[0] * 100
	elif status == ResourceLoader.THREAD_LOAD_LOADED:
		$ProgressBar.value = 100
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(path))

