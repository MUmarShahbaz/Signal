extends Area2D

enum spawnable_mobs {virus, hacker}
var virus = preload("res://components/virus/virus.tscn")
var hacker = preload("res://components/hacker/hacker.tscn")

@export var enabled : bool = false
@export var mob: spawnable_mobs
@export var region: CollisionShape2D
@export var interval: float = 1.0
@export var max_instances: = 2
@onready var extents = (region.shape as RectangleShape2D).extents

var last_spawn: float = 0.0
var n: int = 0

func _process(delta: float) -> void:
	if not enabled: return
	last_spawn += delta
	if last_spawn > interval:
		last_spawn = 0
		var spawn_position = to_global(Vector2(randf_range(-extents.x, extents.x), randf_range(-extents.y, extents.y)))
		var new_mob: CharacterBody2D
		if n >= max_instances:
			return
		match mob:
			spawnable_mobs.virus:
				new_mob = virus.instantiate()
			spawnable_mobs.hacker:
				new_mob = hacker.instantiate()
		n+=1
		new_mob.global_position = spawn_position
		new_mob.tree_exited.connect(Callable(self, "mob_died"))
		add_sibling(new_mob)

func mob_died():
	n -= 1

func enable():
	enabled = true
