extends Node
class_name ProjectileLauncher

@onready var character : CharacterBody2D = get_parent()
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var is_player : bool = (character == player)

@export var projectile: PackedScene
@export var force: float
@export var offset: Vector2
@export var z_index: int = 0
@export var interval: float = 0.5

var last_shot: float = 0

func _process(delta: float) -> void:
	last_shot += delta
	if last_shot > interval:
		if is_player:
			if not (Input.is_action_pressed("up") or Input.is_action_pressed("down")):
				launch(Vector2.RIGHT)
				last_shot = 0
		elif is_instance_valid(player):
			launch(-character.global_position + player.global_position)
			last_shot = 0

func launch(target: Vector2):
	var new_projectile: Projectile = projectile.instantiate()
	new_projectile.global_position = character.global_position + offset
	new_projectile.rotate(atan2(target.y, target.x))
	new_projectile.z_index = z_index
	if is_player:
		new_projectile.collision_mask = 4
	character.add_sibling(new_projectile)
	new_projectile.set_shooter(character)
	new_projectile.apply_force(target.normalized()*force*1000)
