extends Node

var card_scene = preload("res://Scenes/Card_Routine.tscn")

onready var no_routines_img = get_node("Main_Layer/BG/No_Routines")
onready var selection_comer = get_node("Micro_Routines/Micros_BG/Comer/Selection_Comer")
onready var selection_dever = get_node("Micro_Routines/Micros_BG/Dever/Selection_Dever")
onready var selection_escovar = get_node("Micro_Routines/Micros_BG/Escovar/Selection_Escovar")
onready var selection_escola = get_node("Micro_Routines/Micros_BG/Escola/Selection_Escola")
onready var selection_banho = get_node("Micro_Routines/Micros_BG/Banho/Selection_Banho")
onready var selection_roupa = get_node("Micro_Routines/Micros_BG/Roupa/Selection_Roupa")

onready var label_comer = get_node("Micro_Routines/Micros_BG/Comer/Selection_Comer/Label_Comer")
onready var label_dever = get_node("Micro_Routines/Micros_BG/Dever/Selection_Dever/Label_Dever")
onready var label_escovar = get_node("Micro_Routines/Micros_BG/Escovar/Selection_Escovar/Label_Escovar")
onready var label_escola = get_node("Micro_Routines/Micros_BG/Escola/Selection_Escola/Label_Escola")
onready var label_banho = get_node("Micro_Routines/Micros_BG/Banho/Selection_Banho/Label_Banho")
onready var label_roupa = get_node("Micro_Routines/Micros_BG/Roupa/Selection_Roupa/Label_Roupa")

var save_file = File.new()
var save_path = "res://save_routines.save"
var save_data = {"lista_de_clicks":[],"is_routine":false}

onready var card_routine = card_scene.instance()

const IS_ROUTINE = false

var lista_de_clicks = []
const COMER_PRESSED = false
const DEVER_PRESSED = false
const ESCOVAR_PRESSED = false
const ESCOLA_PRESSED = false
const BANHO_PRESSED = false
const ROUPA_PRESSED = false
const COMER = "COMER"
const DEVER = "DEVER"
const ESCOVAR = "ESCOVAR"
const ESCOLA = "ESCOLA"
const BANHO = "BANHO"
const ROUPA = "ROUPA"

func _ready():
	if not save_file.file_exists(save_path):
		create_save()
	else:
		load_list_clicks()
		
	if IS_ROUTINE:
		print("rotina criada")
		no_routines_img.hide()
	else:
		no_routines_img.show()

func create_save():
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func save_list_clicks():
	save_data["lista_de_clicks"] = lista_de_clicks
	save_data["is_routine"] = IS_ROUTINE
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func load_list_clicks():
	save_file.open(save_path, File.READ)
	save_data = save_file.get_var()
	save_file.close()
	lista_de_clicks = save_data["lista_de_clicks"]
	IS_ROUTINE = save_data["is_routine"]
	print("loaded lista, is_routine: ", lista_de_clicks, IS_ROUTINE)
	
func _on_X_button_pressed():
	get_node("Micro_Routines/Micros_BG").hide()
	lista_de_clicks = []
	hide_all_selection()

func add_remove_OnClick(flag, item):
	if flag == true:
		lista_de_clicks.append(item)
		var position = str (lista_de_clicks.find(item) + 1)
		show_selection(item, position)
			
	else:
		for elem in lista_de_clicks:
			if elem == item:
				lista_de_clicks.erase(item)
				hide_selection(item)
				update_positions()
				

func update_positions():
	label_comer.set_text(str (lista_de_clicks.rfind(COMER)+1))
	label_dever.set_text(str (lista_de_clicks.rfind(DEVER)+1))
	label_escovar.set_text(str (lista_de_clicks.rfind(ESCOVAR)+1))
	label_escola.set_text(str (lista_de_clicks.rfind(ESCOLA)+1))
	label_banho.set_text(str (lista_de_clicks.rfind(BANHO)+1))
	label_roupa.set_text(str (lista_de_clicks.rfind(ROUPA)+1))


func show_selection(item, position):
	if item == COMER:
		selection_comer.show()
		label_comer.set_text(position)
	elif item == DEVER:
		selection_dever.show()
		label_dever.set_text(position)
	elif item == ESCOVAR:
		selection_escovar.show()
		label_escovar.set_text(position)
	elif item == ESCOLA:
		selection_escola.show()
		label_escola.set_text(position)
	elif item == BANHO:
		selection_banho.show()
		label_banho.set_text(position)
	else:
		selection_roupa.show()
		label_roupa.set_text(position)


func hide_selection(item):
	if item == COMER:
		selection_comer.hide()
	elif item == DEVER:
		selection_dever.hide()
	elif item == ESCOVAR:
		selection_escovar.hide()
	elif item == ESCOLA:
		selection_escola.hide()
	elif item == BANHO:
		selection_banho.hide()
	else:
		selection_roupa.hide()

func hide_all_selection():
	selection_comer.hide()
	selection_dever.hide()
	selection_escovar.hide()
	selection_escola.hide()
	selection_banho.hide()
	selection_roupa.hide()

func _on_Comer_btn_pressed():
	COMER_PRESSED = not COMER_PRESSED
	add_remove_OnClick(COMER_PRESSED, COMER)
	print(lista_de_clicks)

func _on_Dever_btn_pressed():
	DEVER_PRESSED = not DEVER_PRESSED
	add_remove_OnClick(DEVER_PRESSED, DEVER)
	print(lista_de_clicks)

func _on_Escovar_btn_pressed():
	ESCOVAR_PRESSED = not ESCOVAR_PRESSED
	add_remove_OnClick(ESCOVAR_PRESSED, ESCOVAR)
	print(lista_de_clicks)

func _on_Escola_btn_pressed():
	ESCOLA_PRESSED = not ESCOLA_PRESSED
	add_remove_OnClick(ESCOLA_PRESSED, ESCOLA)
	print(lista_de_clicks)

func _on_Banho_btn_pressed():
	BANHO_PRESSED = not BANHO_PRESSED
	add_remove_OnClick(BANHO_PRESSED, BANHO)
	print(lista_de_clicks)
	
func _on_Roupa_btn_pressed():
	ROUPA_PRESSED = not ROUPA_PRESSED
	add_remove_OnClick(ROUPA_PRESSED, ROUPA)
	print(lista_de_clicks)

func _on_return_button_pressed():
	get_tree().change_scene("res://Scenes/Main_Screen.tscn")

func _on_Create_Routine_button_pressed():
	print("BOTAO APERTADO")
	IS_ROUTINE = true	
	save_list_clicks()
	get_node("Main_Layer/BG").add_child(card_routine)
	get_node("Micro_Routines/Micros_BG").hide()

func _on_button_new_routine_pressed():
	get_node("Micro_Routines/Micros_BG").show()	
	get_node("Timer_enable_create").start()

func _on_Timer_enable_create_timeout():
	get_node("Micro_Routines/Micros_BG/Create_Routine_button").set_disabled(false)