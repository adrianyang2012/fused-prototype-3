extends Node2D
@onready var game: Node2D = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var mode = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation+=delta*mode*0.5
	if rotation>2.7:
		mode = -1
	elif rotation<0.5:
		mode = 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if position.y>0:
		for i in range(15):
			game.summon3(position.x,position.y,40)
			game.summon4(position.x,position.y,25)
	else:
		for i in range(10):
			game.summon3(position.x,position.y,25)
			game.summon4(position.x,position.y,25)
	queue_free()
