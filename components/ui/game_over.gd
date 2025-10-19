extends Control

@export var HUD : Control
var waiting:= false

func _process(delta: float) -> void:
	if waiting and Input.is_action_just_pressed("next"):
		get_tree().change_scene_to_file("res://components/game/game.tscn")

func game_over():
	var time = HUD.get_node("Time").text
	var viruses = HUD.get_node("Kill Count/Virus Counter/Count").text
	var hackers = HUD.get_node("Kill Count/Hacker Counter/Count").text
	HUD.queue_free()
	$Label.text = "GAME OVER!\n\nYou killed %s Viruses and %s Hackers in %s\n\nPress Space to retry....." % [viruses, hackers, time]
	waiting = true
