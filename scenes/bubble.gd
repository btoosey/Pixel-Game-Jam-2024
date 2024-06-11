class_name Bubble
extends RigidBody2D

signal bubble_collided(bubble_one, bubble_two)

var colliding: bool = false
var value: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_2d_area_entered(area):
	if colliding:
		return

	if area.get_parent().value == value:
		colliding = true
		print(self, area.get_parent())
		bubble_collided.emit(self, area.get_parent())
