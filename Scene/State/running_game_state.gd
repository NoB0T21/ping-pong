class_name RunningGameState
extends GameState

var Particles :GPUParticles2D
func enter() -> void:
	Particles = PLAYER.get_node("Particles")
	Particles.visible = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		transition.emit("PausedGameState");

func exit()-> void:
	Particles.visible = false
