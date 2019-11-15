extends Node

const IS_ROUTINE = false
onready var label_crie_rotina = get_node("Micro_Routines/Micros_BG/Label_Crie_Rotina")

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
	if IS_ROUTINE:
		print("rotina criada")
		label_crie_rotina.hide()
	else:
		label_crie_rotina.show()

func _on_Create_routine_btn_pressed():
	get_node("Micro_Routines/Micros_BG").show()
	
func _on_X_button_pressed():
	get_node("Micro_Routines/Micros_BG").hide()

func add_remove_list(flag, item):
	if flag == true:
		lista_de_clicks.append(item)
	else:
		for elem in lista_de_clicks:
			if elem == item:
				lista_de_clicks.erase(item)

func _on_Comer_btn_pressed():
	COMER_PRESSED = not COMER_PRESSED
	add_remove_list(COMER_PRESSED, COMER)
	print(lista_de_clicks)

func _on_Dever_btn_pressed():
	DEVER_PRESSED = not DEVER_PRESSED
	add_remove_list(DEVER_PRESSED, DEVER)
	print(lista_de_clicks)

func _on_Escovar_btn_pressed():
	ESCOVAR_PRESSED = not ESCOVAR_PRESSED
	print("escovar")

func _on_Escola_btn_pressed():
	ESCOLA_PRESSED = not ESCOLA_PRESSED
	print("escola")
	
func _on_Banho_btn_pressed():
	BANHO_PRESSED = not BANHO_PRESSED
	print("banho")
	
func _on_Roupa_btn_pressed():
	ROUPA_PRESSED = not ROUPA_PRESSED
	print("roupa")
