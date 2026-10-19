extends PanelContainer
@onready var player: Label = $HBoxContainer/Player
@onready var opponent: Label = $HBoxContainer/opponent
@onready var round_no: Label = $RoundNo

var playerScore:int = 0;
var opponentScore:int = 0;
var round:int = 1;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.text = str(playerScore)
	opponent.text = str(opponentScore)
	round_no.text = "Round-" + str(round)

func update_player() -> void:
	playerScore += 1
	player.text = str(playerScore)

func update_opponent() -> void:
	print("KOKO")
	opponentScore += 1
	opponent.text = str(opponentScore)

func update_round() -> void:
	round += 1
	round_no.text = "Round-" + str(round)
