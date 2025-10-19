extends Area2D

var player = preload("res://components/player/player.tscn")
@export var HUD : Control

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()

func start():
	var new_player: Player = player.instantiate()
	add_sibling(new_player)
	new_player.get_node("Projectile Launcher").HUD = HUD
	new_player.tree_exited.connect(Callable($"../CanvasLayer/Game Over", "game_over"))
