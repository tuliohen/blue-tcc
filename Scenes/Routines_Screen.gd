extends Node

var save_data = {"lista_de_clicks":[],"is_routine":false}
var lista_de_clicks = []
const IS_ROUTINE = false
var save_file = File.new()
var save_path = "user://save_routines.save"

onready var scroll_list = get_node("CanvasLayer/Panel/ScrollContainer/VBoxContainer")

var empty_control = preload("res://Scenes/Empty_Control.tscn") 
onready var empty_node = empty_control.instance()

const PATH = ""
var card = ""

func _ready():
	if not save_file.file_exists(save_path):
		create_save()
	else:
		load_list_clicks()
	load_routine()

func save_list_clicks():
	save_data["lista_de_clicks"] = lista_de_clicks
	save_data["is_routine"] = IS_ROUTINE
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()
	
func create_save():
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
	if lista_de_clicks == []:
		print("Lista vazia")
	else:
		for item in lista_de_clicks:
			PATH = "res://Scenes/Card_"+item+".tscn" 
			print(PATH)
			card = load(PATH)
			scroll_list.add_child(card.instance())
		scroll_list.add_child(empty_node)