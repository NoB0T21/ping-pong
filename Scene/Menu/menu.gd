extends Control

@export var startButton : Button
@export var quitButton : Button
@export var next_screen : String
@export var animationPlayer : AnimationPlayer

var tween : Tween

func _ready() -> void:
	animation()
	startButton.pressed.connect(startGame);
	quitButton.pressed.connect(quitGame);

func startGame() -> void:
	animationPlayer.play("Click")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_file(next_screen);

func quitGame() -> void:
	animationPlayer.play("ClickQuit")
	await animationPlayer.animation_finished
	get_tree().quit();

func animation() -> void:
	if tween:
		tween.kill();
	tween = create_tween();
	tween.set_parallel(true)
	tween.EASE_IN
	for node:Node in get_tree().get_nodes_in_group("Animation"):
		node.position.y = 15
		tween.tween_property(node,"position:y", 0, .5)
