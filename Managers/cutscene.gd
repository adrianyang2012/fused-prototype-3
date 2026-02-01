extends Node2D

@onready var label: Label = $VillagerFace/Label
@onready var label_2: Label = $VillagerFace/Label2
@onready var label_3: Label = $VillagerFace/Label3
@onready var timer: Timer = $Timer
@onready var camera_2d: Camera2D = $Camera2D
@onready var timer_2: Timer = $Timer2

var frame = 0
var zoom_val =1
func _ready()-> void:
	timer.start()
func _on_timer_timeout() -> void:
	if frame==0:
		label.visible = true
		frame+=1
		timer.start()
	elif frame==1:
		label_2.visible = true
		frame+=1
		timer.start()
	elif frame==2:
		label_3.visible = true
		frame+=1
		timer.start()
	elif frame==3:
		label_3.visible = false
		label.visible = false
		label_2.visible =false
		timer_2.start()
	else:
		get_tree().change_scene_to_file("res://games/startpanel.tscn")
	
	


func _on_timer_2_timeout() -> void:
	
	camera_2d.zoom = Vector2(zoom_val,zoom_val)
	zoom_val-=0.01
	if zoom_val<0.05:
		frame+=1
		timer.start()
		
	else:
		
		timer_2.start()
