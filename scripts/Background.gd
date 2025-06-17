extends Sprite

onready var nave = get_node("../nave")

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	material.set_shader_param("desloca" , (nave.global_position.x - 80) * 0.002)
	
