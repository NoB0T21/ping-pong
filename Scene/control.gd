extends Control

@export var ResumeButton : Button
@export var exitutton : Button
@export var next_screen : String
@export var pauseMenu : PanelContainer
@export var pauseState : GameState
var tween : Tween

func _ready() -> void:
	animation()
	ResumeButton.pressed.connect(resumeGame);
	exitutton.pressed.connect(exitGame);

func resumeGame() -> void:
	if pauseMenu.visible:
		pauseMenu.visible = false;
		pauseState.timerDisplay.visible = true
		animation()

func exitGame() -> void:
	if pauseMenu.visible:
		get_tree().change_scene_to_file(next_screen);

func animation() -> void:
	if tween:
		tween.kill()
		
	tween = create_tween()
	tween.set_parallel(true)
	tween.set_ease(Tween.EASE_IN) 
	
	for node: Node in get_tree().get_nodes_in_group("Animation"):
		node.position.y = 273.68 if node.name == "Timer" else 15
		
		var target_y := 258.68 if node.name == "Timer" else 0.0
		
		tween.tween_property(node, ^"position:y", target_y, 0.5)
