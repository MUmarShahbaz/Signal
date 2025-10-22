extends Control

@onready var label:Label = $Label

var messages: Array[String] = [
	"Welcome, to Signal...",
	"FYI, You are a data packet",
	"Your task is to carry the user's signal\nacross the Internet",
	"The Internet is a vile place",
	"Viruses just floating around\n and Hackers trying to capture you",
	"Yet, travel you must....",
	"Use WS or\nUp/Down Arrow keys to move"
]
var continue_message: String = "Press Space to continue........"
var current_text: int = 0

signal start()

func _process(_delta: float) -> void:
	if current_text >= messages.size(): return
	label.text = messages[current_text] + "\n\n" + continue_message
	if Input.is_action_just_pressed("next"):
		current_text += 1
	if current_text >= messages.size():
		label.text = ""
		emit_signal("start")
		$sfx.play()
		await $sfx.finished
		queue_free()
