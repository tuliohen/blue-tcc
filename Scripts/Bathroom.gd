extends Node

var menino_escova = preload("res://Assets/Rotinas/Banheiro/menino_segurando_escova.png")
var menino_pasta = preload("res://Assets/Rotinas/Banheiro/menino_colocando_pasta.png")
var menino_escovando_dente = preload("res://Assets/Rotinas/Banheiro/menino_escovando_dente_parte1.png")
var menino_lavando_escova = preload("res://Assets/Rotinas/Banheiro/menino_lavando_escova_parte1.png")
var menino_idle = preload("res://Assets/Rotinas/Banheiro/menino_idle.png")

onready var character = get_node("CanvasLayer/Character")
onready var paste = get_node("CanvasLayer/Tooth_Paste")
onready var som = get_node("Positive_Feedback")
onready var sound = 0

onready var botao_escova = get_node("CanvasLayer/Red_Brush")
onready var botao_character = get_node("CanvasLayer/Character/Character_button")
onready var botao_faucet = get_node("CanvasLayer/Faucet/Faucet_button")
onready var botao_glass = get_node("CanvasLayer/Glass/Glass_button")

onready var botao_som = get_node("Selection_Sound")

func _on_Red_Brush_pressed():
	botao_som.play(0)
	botao_escova.set_disabled(true)
	botao_escova.hide()
	character.set_texture(menino_escova)
	get_node("CanvasLayer/Tooth_Paste/TouchScreenButton").show()
	get_node("CanvasLayer/Tooth_Paste/Anim_Paste").play("Blink")
	
func _on_TouchScreenButton_pressed():
	botao_som.play(0)
	character.set_texture(menino_pasta)
	paste.hide()
	get_node("CanvasLayer/Character/Anim_Char").play("Blink_Char")
	botao_character.show()

func _on_Character_button_pressed():
	get_node("CanvasLayer/Tooth_Paste").set_modulate("ffffff")
	botao_som.play(0)
	get_node("CanvasLayer/Red_Brush/Brush_Sound").play()
	paste.show()
	character.set_modulate("ffffff")
	botao_character.hide()
	get_node("CanvasLayer/Tooth_Paste/Anim_Paste").stop_all()
	get_node("CanvasLayer/Tooth_Paste/TouchScreenButton").hide()
	character.set_texture(menino_escovando_dente)
	get_node("CanvasLayer/Character/Anim_Char").stop_all()
	get_node("CanvasLayer/Character/Arm").show()
	get_node("CanvasLayer/Character/Anim_Char").play("Brushing_Tooth")
	get_node("CanvasLayer/Character/Bubble").show()
	get_node("CanvasLayer/Timer_to_faucet").start()
	
func _on_Timer_to_faucet_timeout():
	get_node("CanvasLayer/Red_Brush/Brush_Sound").stop()
	character.set_texture(menino_lavando_escova)
	get_node("CanvasLayer/Character/Bubble").hide()
	get_node("CanvasLayer/Character/Arm").hide()
	get_node("CanvasLayer/Character/Anim_Char").stop_all()
	get_node("CanvasLayer/Character/Arm_Washing").show()
	get_node("CanvasLayer/Faucet/Anim_Faucet").play("Blink_Faucet")
	botao_faucet.show()

func _on_Faucet_button_pressed():
	get_node("CanvasLayer/Faucet").set_modulate("ffffff")
	get_node("CanvasLayer/Faucet/Anim_Faucet").stop_all()
	get_node("CanvasLayer/Faucet/Water").show()
	get_node("Timer_to_wash").start()
	get_node("CanvasLayer/Faucet/Water_Sound").play(0)
	botao_faucet.hide()

func _on_Timer_to_wash_timeout():
	get_node("CanvasLayer/Glass/Anim_Glass").play("Blink_Glass")
	get_node("CanvasLayer/Glass/Glass_button").show()
	botao_glass.show()
	
func _on_Glass_button_pressed():
	get_node("CanvasLayer/Glass").set_modulate("ffffff")
	get_node("CanvasLayer/Red_Brush").set_modulate("ffffff")
	botao_som.play(0)
	get_node("CanvasLayer/Faucet/Water_Sound").stop()
	print("pressed")
	botao_glass.hide()
	character.set_texture(menino_idle)
	get_node("CanvasLayer/Faucet/Water").hide()
	get_node("CanvasLayer/Character/Arm_Washing").hide()
	get_node("CanvasLayer/Glass/Anim_Glass").stop_all()
	get_node("CanvasLayer/Red_Brush").show()
	get_node("CanvasLayer/Red_Brush/Anim_Brush").stop_all()
	get_node("Timer_to_change").start()
	

func _on_Timer_to_change_timeout():
	get_tree().change_scene("res://Scenes/Concluido.tscn")
