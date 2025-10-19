extends Control

@onready var label:Label = $Label

var messages: Array[String] = [
	"Welcome, to Signal...",
	"In case you still don't understand,\nthe user just sent a signal to his friend.",
	"And you, my buddy ol' pal, are that signal.",
	"You're job is to go through the internet,\na place full of floating viruses.",
	"Beware of Hackers trying to crack you open!!",
	"Use WS or Up Down Arrow keys to move"
]
var continue_message: String = "Press Space to continue........"
var current_text: int = 0

signal start()

func _process(_delta: float) -> void:
	label.text = messages[current_text] + "\n\n" + continue_message
	if Input.is_action_just_pressed("next"):
		current_text += 1
	if current_text >= messages.size():
		emit_signal("start")
		queue_free()
