class_name GameState
extends State

var PLAYER: Ball

func _ready() -> void:
	await  owner.ready
	PLAYER = owner as Ball
