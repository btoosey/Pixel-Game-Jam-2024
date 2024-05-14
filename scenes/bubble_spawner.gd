extends Node2D

@export var speed: float = 1.1
@export var bubble : PackedScene = preload("res://scenes/bubble.tscn")
@onready var bubbles = $"../Bubbles"
var can_spawn_bubble = true
@onready var timer = $Timer

func _physics_process(_delta):
	if Input.is_action_pressed("move_left"):
		if position.x <= 100:
			return
		else:
			position.x -= speed

	if Input.is_action_pressed("move_right"):
		if position.x >= 200:
			return
		else:
			position.x += speed

	if Input.is_action_just_pressed("spawn_bubble"):
		if not can_spawn_bubble:
			return

		var _bubble = bubble.instantiate()
		can_spawn_bubble = false
		bubbles.add_child(_bubble)
		_bubble.position = position
		timer.start()

func _on_timer_timeout():
	can_spawn_bubble = true
