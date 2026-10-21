class_name NextRoundGameState
extends GameState
@onready var next_round: PanelContainer = $"../../Control/NextRound"
@onready var round_count: Label = $"../../Control/NextRound/Round Count"
@onready var timer: Label = $"../../Control/NextRound/Timer"
@export var SPEED : float
var time_left : float = 2.0

func enter() -> void:
	PLAYER.global_position = Vector2(425,240)
	PLAYER.Speed=SPEED;
	Opp.SPEED = SPEED
	PLAY.SPEED = SPEED
	time_left=2.0
	get_tree().paused=true;
	next_round.visible = true;
	round_count.text = "Round: "+str(ScoreBoard.round)

func update(delta: float)-> void:
	if time_left > 0:
		time_left -= delta
		timer.text = "In "+str(int(ceil(time_left))) 
		
		if time_left <= 0:
			get_tree().paused = false
			transition.emit("RunningGameState")

func exit()-> void:
	time_left = 2.0;
	get_tree().paused = false
	next_round.visible = false;
