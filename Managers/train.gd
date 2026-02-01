extends Area2D

@onready var player: CharacterBody2D = $"../Player"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	player.position.x = 73475.0
	player.position.y = 3531.0
