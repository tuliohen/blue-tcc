extends Node

var menino_escova = preload("res://Assets/Rotinas/Banheiro/menino_segurando_escova.png")
var menino_pasta = preload("res://Assets/Rotinas/Banheiro/menino_colocando_pasta.png")
var menino_escovando_dente = preload("res://Assets/Rotinas/Banheiro/menino_escovando_dente_parte1.png")

onready var character = get_node("CanvasLayer/Character")
onready var paste = get_node("CanvasLayer/Tooth Paste")

func _on_Red_Brush_pressed():
	get_node("CanvasLayer/Red Brush").set_disabled(true)
	get_node("CanvasLayer/Red Brush").hide()
	character.set_texture(menino_escova)
	get_node("CanvasLayer/Tooth Paste/TouchScreenButton").show()
	get_node("CanvasLayer/Tooth Paste/Anim_Paste").play("Blink")
	

func _on_TouchScreenButton_pressed():
	character.set_texture(menino_pasta)
	paste.hide()