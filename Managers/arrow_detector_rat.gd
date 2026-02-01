extends Area2D
@onready var rat: Area2D = $".."

@onready var label: Label = $Label
@onready var timer: Timer = $Timer


func _on_area_entered(area: Area2D) -> void:
	rat.ouch()
	label.text = "1"
	timer.start()

func _on_timer_timeout() -> void:
	
	label.text = ""
