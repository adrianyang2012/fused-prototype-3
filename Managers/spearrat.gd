extends Node2D
@onready var timer: Timer = $Timer
@onready var label: Label = $Label

func ouch() -> void:
	positive = 1
	health-=1
	timer.start()
# Called when the node enters the scene tree for the first time.
var confused = 0
func spawn(x,y) -> void:
	pass # Replace with function body.
@onready var player: CharacterBody2D = $"../Player"

@onready var game: Node2D = $".."
@onready var timer_2: Timer = $Timer2


@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d_3: RayCast2D = $RayCast2D3
@onready var ray_cast_2d_4: RayCast2D = $RayCast2D4
var health = 5
var positive = 0
var up = 0
@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
# Called every frame. 'delta' is the elapsed time since the previous frame.
var sprint = 0
func _process(delta: float) -> void:
	if randf()>0.98:
		sprint = 1
		timer_2.start()
	if health<1:
		corruption_manager.upgrade()
		queue_free()
	if position.y>10000:
		queue_free()
	
	up = 0
	
	if positive:
		if player.position.x>position.x:
			if not ray_cast_2d_4.is_colliding():
				position.x+=delta*(-250)

		else:
			if not ray_cast_2d.is_colliding():
				position.x-=delta*(-250)



	else:
		if not confused:
			if player.position.x>position.x:
				if not ray_cast_2d.is_colliding():
					position.x+=delta*(850+sprint*650)
				else:
					up=1
					
					if not ray_cast_2d_3.is_colliding():
						position.y-=350*delta
					

			else:
				if not ray_cast_2d_4.is_colliding():
					position.x-=delta*(850+sprint*650)
				else:
					up = 1
					if not ray_cast_2d_3.is_colliding():
						position.y-=350*delta

	if not ray_cast_2d_2.is_colliding() and not up:
		position.y+=650*delta		
	
func confusion() -> void:
	confused = 1
func unconfusion() -> void:
	confused = 0



func _on_body_entered(body: Node2D) -> void:
	print('aa')
	health_manager.ouch()
	
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"



func _on_timer_timeout() -> void:
	positive = 0


func _on_body_exited(body: Node2D) -> void:
	health_manager.unouch()
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	sprint = 0
