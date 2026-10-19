class_name IdelGameState extends GameState

@export var timerDisplay : PanelContainer
@export var lable : Label
@export var ball : Ball 

var time_left : float = 3.0

func enter() -> void:
	ball.global_position = Vector2(425,240)
	time_left=3.0;
	ball.Speed=200;
	timerDisplay.visible = true;
	get_tree().paused = true;

func update(delta: float) -> void:
	if time_left > 0:
		time_left -= delta
		lable.text = str(int(ceil(time_left))) 
		
		if time_left <= 0:
			get_tree().paused = false
			transition.emit("RunningGameState")

func exit()-> void:
	time_left = 3.0
	get_tree().paused = false
	timerDisplay.visible = false
