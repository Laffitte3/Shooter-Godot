extends Area2D


var direccion : Vector2
var speed: int = 600


func _process(delta):
	global_position += speed * direccion * delta



func _on_body_entered(body):
	if body.is_in_group("Enemigos"):
		body.Morir()
		queue_free()

func _on_timer_timeout():
	queue_free()
