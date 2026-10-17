extends Control

@export var next_screen : String

func _ready() -> void:
	$Timer.timeout.connect(_on_loading_finished);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_loading_finished() -> void:
	get_tree().change_scene_to_file(next_screen);
