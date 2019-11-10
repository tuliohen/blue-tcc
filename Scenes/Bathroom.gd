extends Node

var menino_escova = preload("res://Assets/Rotinas/Banheiro/menino_segurando_escova.png")
onready var character = get_node("CanvasLayer/Character")


func _on_Red_Brush_pressed():
	get_node("CanvasLayer/Red Brush").set_disabled(true)
	get_node("CanvasLayer/Red Brush").hide()
	character.set_texture(menino_escova)
	print("botao clicado")
