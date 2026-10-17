class_name IdelGameState extends GameState

@export var timerDisplay : PanelContainer
@export var lable : Label
var time_left : float = 3.0

func enter() -> void:
	time_left=3.0
	timerDisplay.visible = true
	get_tree().paused = true

func update(delta: float) -> void:
	if time_left > 0:
		time_left -= delta
		lable.text = str(ceil(time_left)) 
		
		if time_left <= 0:
			get_tree().paused = false
			transition.emit("RunningGameState")

func exit()-> void:
	time_left = 3.0
	get_tree().paused = false
	timerDisplay.visible = false
