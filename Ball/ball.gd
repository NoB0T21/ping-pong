class_name Ball
extends RigidBody2D

@export var Speed:float = 200.0
@export var PADDLE_HALF_HEIGHT: float = 20;
@onready var RunningState : GameState = $"../GameStateMachine/RunningGameState"
@onready var opponent: CharacterBody2D = $"../opponent"

func _ready() -> void:
	randomize()
	continuous_cd = RigidBody2D.CCD_MODE_CAST_SHAPE
	var randDirX: int = [1, -1].pick_random()
	var randDirY: float = randf_range(-1.0, 1.0)
	linear_velocity = Vector2(randDirX, randDirY).normalized() * Speed

func _process(delta: float) -> void:
	linear_velocity = linear_velocity.normalized() * Speed
	DebugPanel.add_debug_property("Ball Speed", str(Speed))

func _on_body_entered(body: Node) -> void:
	var paddle_y: float = body.global_position.y
	var ball_y: float = global_position.y
	var relative_intersect_y := (ball_y-paddle_y)/PADDLE_HALF_HEIGHT;
	relative_intersect_y = clamp(relative_intersect_y, -1.0, 1.0)
	var max_bounce_angle := deg_to_rad(60.0)
	var bounce_angle := relative_intersect_y * max_bounce_angle
	
	if body.is_in_group("DeadZone"):
		get_tree().paused = true;
		if body.name=="DeadZoneLeft":
			ScoreBoard.update_opponent()
		if body.name=="DeadZoneRight":
			ScoreBoard.update_player()
		ScoreBoard.update_round()
		RunningState.transition.emit("NextRoundGameState")
		return
		
	elif body.is_in_group("Paddle"):
		var direction_x := 1 if linear_velocity.x < 0 else -1;
		var new_direction := Vector2(direction_x * cos(bounce_angle), sin(bounce_angle)).normalized();
		linear_velocity = new_direction * Speed;
		opponent.SPEED += 3
		Speed += 10
	else:
		var direction_x := -1 if linear_velocity.x < 0 else 1;
		var new_direction := Vector2(direction_x * cos(bounce_angle), sin(bounce_angle)).normalized();
		linear_velocity = new_direction * Speed;
