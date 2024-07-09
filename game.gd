extends Node


var enemigoEscena=preload("res://enemigo.tscn")

var enemigos_Matar: int
@onready var label_enemigos=$CanvasLayer/HBoxContainer/LabelEnemigos

func _ready():
	enemigos_Matar= randf_range(1,3)
	label_enemigos.text= str(enemigos_Matar)
	$Timer.connect("timeout",CrearEnemigo)
	print(" voy a crear un enemigo")
	$VictoriaCanvasLayer2.visible=false
	
func CrearEnemigo():
	
	print("enemigo creado")
	var enemigocreado= enemigoEscena.instantiate()
	enemigocreado.global_position =Vector2(randf_range(0,1157),randf_range(0,642))
	enemigocreado.connect("seMurio",bajarcontador)
	add_child(enemigocreado)
	
func bajarcontador():
	enemigos_Matar -= 1
	label_enemigos.text= str(enemigos_Matar)
	if enemigos_Matar <=0:
		get_tree().paused = true
		$VictoriaCanvasLayer2.visible=true
		
func _on_button_reiniciar_pressed():
	#enemigos_Matar= randf_range(1,3)
	#label_enemigos.text= str(enemigos_Matar)
	get_tree().paused = false
	get_tree().reload_current_scene()
	$VictoriaCanvasLayer2.visible=false
	


func _on_button_salir_pressed():
	get_tree().quit()
	
