class_name Opponent extends CharacterBody2D

@onready var BALL_NODE : RigidBody2D = $"../Ball"

@export var SPEED:float = 200.0;
var position_X:float

func _ready() -> void:
	position_X = get_viewport_rect().size.x * 0.99

func _physics_process(delta: float) -> void:
	DebugPanel.add_debug_property("opponent Speed", str(SPEED));
	if BALL_NODE:
		if (BALL_NODE.linear_velocity.x > 0):
			var direction := BALL_NODE.global_position.y - global_position.y
			if abs(direction) > 15.0:
				var move_direction :float = sign(direction)
				velocity.y = move_direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	position.x=position_X;
	velocity.x=0
	move_and_slide()
