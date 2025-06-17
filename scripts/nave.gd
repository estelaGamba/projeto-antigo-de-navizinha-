extends Node2D

#modelo para se criar lazer
const PRE_LAZER = preload("res://cenas/lazer.tscn")

# variavel global 
#("export" permite possa editar as variavels fora do gdscript)
export var vel = 70

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
# chama o comando 60 vezes por segundo
func _process(delta):
	var dirX = 0
	var dirY = 0
	
	#faz a nave andar
	if Input.is_action_pressed("ui_left"):
		dirX += -1
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	
	if Input.is_action_pressed("ui_up"):
		dirY += -1
	if Input.is_action_pressed("ui_down"):
		dirY += 1
	# atira um lazer apertando uma vez o espaco
	# MY SUPER LAZER PISS!!!
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().get_nodes_in_group("lazers").size() < 3:
			var lazer = PRE_LAZER.instance()
			get_parent().add_child(lazer)
			lazer.global_position = $blaster.global_position 
	
	translate(Vector2(dirX , dirY) * vel * delta)
	
	#impede que a nave saia da tela (tome cuidado com exesso de if)
	global_position.x = clamp(global_position.x , 21 , 139)
	global_position.y = clamp(global_position.y , 25 , 268)
