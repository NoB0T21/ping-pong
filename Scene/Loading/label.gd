extends Label

@export var base_text: String = "Loading"
@export var update_speed: float = 0.5 

var timer: float = 0.0
var dot_count: int = 0

func _process(delta: float) -> void:
	timer += delta
	
	if timer >= update_speed:
		timer = 0.0
		
		dot_count = (dot_count + 1) % 4
		
		var dots := ""
		for i in range(dot_count):
			dots += "."
		
		text = base_text + dots
