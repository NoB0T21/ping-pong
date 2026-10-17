class_name PausedGameState
extends GameState

@export var menuDisplay : Control
@export var timerDisplay : PanelContainer
@export var lable : Label
var time_left : float = 3.0

func enter() -> void:
	time_left = 3.0
	get_tree().paused = true;
	var pauseMenu:PanelContainer = menuDisplay.get_node("PauseMenu")
	menuDisplay.animation()
	pauseMenu.visible=true

func update(delta: float) -> void:
	if timerDisplay.visible:
		if time_left > 0:
				time_left -= delta
				lable.text = str(ceil(time_left)) 
				
				if time_left <= 0:
					get_tree().paused = false
					transition.emit("RunningGameState")

func exit()-> void:
	get_tree().paused = false
	timerDisplay.visible = false
