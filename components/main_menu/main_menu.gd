extends Control

func _on_start_pressed() -> void:
	$start.queue_free()
	$AnimationPlayer.play("Play")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://components/game/game.tscn")
