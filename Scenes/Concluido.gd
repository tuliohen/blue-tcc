extends Node

onready var som = get_node("feedback")
var sound = 0

const CAM_CERTO = 0
const EXCELENTE = 1
const CONTINUE_ASSSIM = 2
const ISSO_MESMO = 3
const OTIMO = 4
const PARABENS = 5

func _ready():
	randomize()

func play_feedback():
	sound += int(rand_range(0,5))
	print(sound)
	if sound == CAM_CERTO:
		som.set_stream(load("res://Assets/Sounds/Falas/CaminhoCerto.ogg"))
		som.play(0)
	elif sound == EXCELENTE:
		som.set_stream(load("res://Assets/Sounds/Falas/Excelente.ogg"))
		som.play(0)
	elif sound == CONTINUE_ASSSIM:
		som.set_stream(load("res://Assets/Sounds/Falas/ContinueAssim.ogg"))
		som.play(0)
	elif sound == ISSO_MESMO:
		som.set_stream(load("res://Assets/Sounds/Falas/IssoMesmo.ogg"))
		som.play(0)
	elif sound == OTIMO:
		som.set_stream(load("res://Assets/Sounds/Falas/OtimoTrabalho.ogg"))
		som.play(0)
	else:
		som.set_stream(load("res://Assets/Sounds/Falas/Parabens.ogg"))
		som.play(0)