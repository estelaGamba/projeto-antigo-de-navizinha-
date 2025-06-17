extends Node2D

var vel = 200

func _ready():
	pass # Replace with function body.


func _process(delta):
	translate(Vector2(0 , -1) * vel * delta)

# quando sai da tela o tiro se destroi
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area_area_entered(area: Area2D) -> void:
	queue_free()
