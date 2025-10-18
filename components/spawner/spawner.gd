extends Area2D

@export var item: PackedScene
@export var region: CollisionShape2D
@export var interval: float = 1.0
@onready var extents = (region.shape as RectangleShape2D).extents

var last_spawn: float = 0.0

func _process(delta: float) -> void:
	last_spawn += delta
	if last_spawn > interval:
		last_spawn = 0
		var position = to_global(Vector2(randf_range(-extents.x, extents.x), randf_range(-extents.y, extents.y)))
		var new_item: CharacterBody2D = item.instantiate()
		new_item.global_position = position
		add_sibling(new_item)
