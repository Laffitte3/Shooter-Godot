class_name Jugador
extends CharacterBody2D

var vida: int = 100
var speed: int =200
var Bala = preload("res://bala.tscn")
var flag: bool = false

func _input(event):
	if Input.is_action_pressed("disparar") and event is InputEventMouseButton:
		var bala = Bala.instantiate()
		bala.direccion = (get_global_mouse_position()-global_position).normalized()
		bala.global_position = global_position
		get_parent().add_child(bala)
		print(event)
	
func _physics_process(delta):
	
	"""var movVectorDerIzq = Input.get_axis("ui_left","ui_right")
	var movVectorArrAbj = Input.get_axis("ui_up","ui_down")
	var movAmbas = Vector2(movVectorDerIzq,movVectorArrAbj).normalized()
	
	var movimiento = Vector2(Input.get_axis("ui_left","ui_right"), Input.get_axis("ui_up","ui_down"))
	"""
	var movimiento= Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if Input.is_action_just_pressed("ui_left"):
		$".".scale.x = -1
		
		
	if Input.is_action_just_pressed("ui_right"):
		$".".scale.x = -1
		

	velocity = movimiento.normalized() * speed

	move_and_slide()


func _on_area_2d_body_entered(body):
		if body.is_in_group("Enemigos") and flag==false:
			vida -= body.dano
			flag= true
			$"CanvasLayer/HBoxContainer/HP ProgressBar".value=vida
			$Area2D/CollisionShape2D.set_deferred("disabled",true)
			$Area2D/Timer.start()
			print(vida)
			if vida == 0:
				morir()
			
			
func morir():
	get_tree().reload_current_scene()
					
func _on_timer_timeout():
	$Area2D/CollisionShape2D.set_deferred("disabled",false)
	flag = false
	
	
