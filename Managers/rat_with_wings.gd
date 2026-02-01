extends Node2D
@onready var timer: Timer = $Timer

func ouch() -> void:
	positive = 1
	health-=1
	timer.start()
var confused =0 
# Called when the node enters the scene tree for the first time.
func spawn(x,y) -> void:
	pass # Replace with function body.
@onready var player: CharacterBody2D = $"../Player"

@onready var game: Node2D = $".."


@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d_3: RayCast2D = $RayCast2D3
@onready var ray_cast_2d_4: RayCast2D = $RayCast2D4
var health = 5
var positive = 0
@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _process(delta: float) -> void:
	if position.y>10000:
		queue_free()
	if health<1:
		corruption_manager.upgrade()
		queue_free()
	if player.position.y<position.y:
		if not ray_cast_2d_3.is_colliding():
			position.y-=750*delta

	if positive:
		if player.position.x>position.x:
			if not ray_cast_2d_4.is_colliding():
				position.x+=delta*(-650)

		else:
			if not ray_cast_2d.is_colliding():
				position.x-=delta*(-650)



	else:
		if not confused:
			if player.position.x>position.x:
				if not ray_cast_2d.is_colliding():
					position.x+=delta*(650)
				else:
					if not ray_cast_2d_3.is_colliding():
						position.y-=750*delta
					

			else:
				if not ray_cast_2d_4.is_colliding():
					
					position.x-=delta*(650)


	if not ray_cast_2d_2.is_colliding() and player.position.y>position.y:
		position.y+=350*delta        
	
		



func _on_body_entered(body: Node2D) -> void:
	health_manager.ouch()
	
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"

func confusion() -> void:
	confused = 1
func unconfusion() -> void:
	confused = 0
func _on_timer_timeout() -> void:
	positive = 0


func _on_body_exited(body: Node2D) -> void:
	health_manager.unouch()
	pass # Replace with function body.
