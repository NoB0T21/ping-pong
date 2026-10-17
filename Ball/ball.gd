class_name Ball
extends RigidBody2D

@export var Speed:float = 200.0
@export var PADDLE_HALF_HEIGHT: float = 20;
@onready var RunningState : GameState = $"../GameStateMachine/RunningGameState"

func _ready() -> void:
	randomize();
	var randDirX:int = [1, -1].pick_random();
	#var randDirX:int = -1;
	var randDirY: float = randf_range(-1.0, 1.0);
	
	linear_velocity = Vector2(randDirX, randDirY).normalized() * Speed;

func _process(delta: float) -> void:
	linear_velocity = linear_velocity.normalized() * Speed;
	DebugPanel.add_debug_property("Ball Speed", str(Speed));

func _on_body_entered(body: Node) -> void:
	var paddle_y: float = body.global_position.y;
	var ball_y: float = global_position.y;

	var relative_intersect_y := (ball_y-paddle_y)/PADDLE_HALF_HEIGHT;
	relative_intersect_y = clamp(relative_intersect_y, -1.0, 1.0);

	var max_bounce_angle := deg_to_rad(60.0);
	var bounce_angle := relative_intersect_y * max_bounce_angle;
	
	if body.is_in_group("Paddle"):
		var direction_x := 1 if linear_velocity.x < 0 else -1;
		
		var new_direction := Vector2(direction_x * cos(bounce_angle), sin(bounce_angle)).normalized();
		linear_velocity = new_direction * Speed;
	if body.is_in_group("DeadZone"):
		get_tree().paused = true;
		RunningState.transition.emit("NextRoundGameState")
	else:
		var direction_x := -1 if linear_velocity.x < 0 else 1;
		
		var new_direction := Vector2(direction_x * cos(bounce_angle), sin(bounce_angle)).normalized();
		linear_velocity = new_direction * Speed;
	Speed=Speed+10;
