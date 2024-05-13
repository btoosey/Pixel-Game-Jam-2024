extends Node2D

@export var speed: float = 1.1
@export var bubble : PackedScene = preload("res://scenes/bubble.tscn")

func _physics_process(_delta):
	if Input.is_action_pressed("move_left"):
		if position.x <= -50:
			return
		else:
			position.x -= speed
	if Input.is_action_pressed("move_right"):
		if position.x >= 50:
			return
		else:
			position.x += speed
	if Input.is_action_pressed("spawn_bubble"):
		var _bubble = bubble.instantiate()
		_bubble.position = position
