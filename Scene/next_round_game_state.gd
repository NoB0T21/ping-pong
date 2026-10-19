class_name NextRoundGameState
extends GameState
@onready var next_round: PanelContainer = $"../../Control/NextRound"
@onready var round_count: Label = $"../../Control/NextRound/Round Count"

var time_left : float = 2.0

func enter() -> void:
	print("NExtRound") 
	time_left=2.0
	get_tree().paused=false;
	next_round.visible = true;
	round_count.text = str(ScoreBoard.round)

func update(delta: float)-> void:
	if time_left > 0:
		time_left -= delta
		
		if time_left <= 0:
			get_tree().paused = false
			transition.emit("IdelGameState")

func exit()-> void:
	time_left = 2.0;
	next_round.visible = false;
