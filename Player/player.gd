extends CharacterBody2D


@export var SPEED := 300.0
var position_X :float

func _ready() -> void:
	position_X = get_viewport_rect().size.x * 0.01
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Restart"):
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	if DebugPanel.visible:
		var fps: String = str(Engine.get_frames_per_second())
		DebugPanel.add_debug_property("FPS", fps)
		DebugPanel.add_debug_property("Player_Pos", str(global_position))
	var direction := Input.get_axis("ui_up", "ui_down")
	position.x=position_X;
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
