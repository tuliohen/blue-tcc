extends Node

var save_data = {"lista_de_clicks":[],"is_routine":false}
var lista_de_clicks = []
const IS_ROUTINE = false
var save_file = File.new()
var save_path = "res://save_routines.save"

var card_comer = preload("res://Scenes/Card_Comer.tscn")
var card_escovar = preload("res://Scenes/Card_Escovar.tscn")
var card_banho = preload("res://Scenes/Card_Banho.tscn")
var card_escola = preload("res://Scenes/Card_Escola.tscn")
var card_roupa = preload("res://Scenes/Card_Roupa.tscn")
var card_dever = preload("res://Scenes/Card_Dever.tscn")

func _ready():
	load_list_clicks()
	pass

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
	

func load_routine():
	pass

