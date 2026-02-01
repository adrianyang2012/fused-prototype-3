extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


@onready var player: CharacterBody2D = $"../Player"

@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"

@onready var inventory_manager: Node2D = $"../Player/Inventory manager"


func _on_body_entered(body: Node2D) -> void:
	player.speed_upgrade()
	queue_free()
