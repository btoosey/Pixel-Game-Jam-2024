extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bubble_collided(bubble_one, bubble_two):
	var bubble_one_pos: Vector2 = bubble_one.position
	var bubble_two_pos: Vector2 = bubble_two.position

	bubble_one.queue_free()
	bubble_two.queue_free()


func _on_bubble_spawner_bubble_created():
	update_children()

func update_children():
	for child in get_children():
		child.bubble_collided.connect(_on_bubble_collided)

