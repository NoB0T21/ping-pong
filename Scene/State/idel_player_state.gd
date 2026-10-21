class_name IdelGameState extends GameState

@export var timerDisplay : PanelContainer
@export var lable : Label
@export var SPEED : float
var time_left : float = 3.0

func enter() -> void:
	PLAYER.global_position = Vector2(425,240)
	Opp.SPEED = SPEED
	PLAY.SPEED = SPEED
	time_left=3.0;
	PLAYER.Speed=SPEED;
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
