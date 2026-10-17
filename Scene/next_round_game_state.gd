class_name NextRoundGameState
extends GameState


func enter() -> void:
	print("NExtRound") 
	get_tree().paused=false
	transition.emit("IdelGameState")
