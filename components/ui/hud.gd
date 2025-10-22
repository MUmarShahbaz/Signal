extends Control

@onready var time: Label = $Time
@onready var virus: Label = $"Kill Count/Virus Counter/Count"
@onready var hacker: Label = $"Kill Count/Hacker Counter/Count"
@onready var sfx: AudioStreamPlayer = $sfx

var seconds: float = 0.0
var begin: bool = false

func start():
	begin = true

func _process(delta: float) -> void:
	if begin:
		seconds += delta
		time.text = formatted_time()

func killed_virus():
	sfx.play()
	virus.text = str(int(virus.text) + 1)

func killed_hacker():
	sfx.play()
	hacker.text = str(int(hacker.text) + 1)

func formatted_time():
	var total_seconds:int = int(seconds)
	var minutes:int = total_seconds / 60
	var secs:int = total_seconds % 60
	return "%02d:%02d" % [minutes, secs]
