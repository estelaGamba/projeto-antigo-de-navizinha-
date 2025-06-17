extends Node2D

var chosen = 0

func _ready():
	randomize()
	for a in $asteroids.get_children():
		a.visible = false
	
	chosen = (randi() % $asteroids.get_child_count()) + 1
	
	var node = get_node("asteroids/Asteroid-" + str(chosen))
	
	node.visible = true
	# faz a colicao mudar de tamanho junto 
	$Area/shape.shape.radius = node.texture.get_width() / 2

func _process(delta):
	pass

# colicao do asteride
func _on_Area_area_entered(area: Area2D) -> void:
	queue_free() # se destroi quando colide com o lazer (de mijo)
