class_name RunningGameState
extends GameState

func enter() -> void:
	print("Running") 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		transition.emit("PausedGameState");
