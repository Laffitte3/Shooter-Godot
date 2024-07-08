extends CharacterBody2D

var jugador
var speedEnemigo: int = 200
var dano: int = 10

signal seMurio

func _ready():
	jugador= get_tree().get_first_node_in_group("MiJugador")
	
	
func _physics_process(delta):
	
	if jugador != null:
		
		velocity= (jugador.global_position - global_position).normalized() * speedEnemigo
		
		move_and_slide()
		
func Morir():
	emit_signal("seMurio")
	queue_free()
