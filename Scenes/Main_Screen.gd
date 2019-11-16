extends Node

var password = ""

var save_file = File.new()
var save_path = "res://savegame.save"
var save_data = {"password": ""}

onready var enter_button = get_node("Bar/Top_Menu/Enter_Button")
onready var password_box = get_node("Bar/Top_Menu/Password_Box")
onready var register_button = get_node("Bar/Top_Menu/Register")
onready var password_box_register = get_node("Bar/Top_Menu/Password_Box_Register")

const FLAG_PWD = false

func _ready():
	if not save_file.file_exists(save_path):
		create_save()
	else:
		load_password()

func create_save():
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func save_password():
	save_data["password"] = password
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func load_password():
	save_file.open(save_path, File.READ)
	save_data = save_file.get_var()
	save_file.close()
	password = save_data["password"]
	print("loaded password: ", password)
	
func _on_Routines_btn_pressed():
	get_tree().change_scene("res://Scenes/Routines_Screen.tscn")
	pass # replace with function body

func _on_Menu_Button_pressed():
	print("menu pressed")
	get_node("Anim_Bar").play("Drop_Bar")

func _on_Register_button_pressed():
	enter_button.hide()
	password_box.hide()
	register_button.hide()
	password_box_register.show()
	print("register pressed")
	pass # replace with function body

func _on_Enter_Button_pressed():
	var password_input = get_node("Bar/Top_Menu/Password_Box/current_password").get_text()
	if password_input != password:
		print("senha errada")
	else:
		get_tree().change_scene("res://Scenes/Parents_Screen.tscn")

func _on_Cancel_btn_pressed():
	get_node("Anim_Bar").play("Up_Bar")

func register_password():
	var new_password = get_node("Bar/Top_Menu/Password_Box_Register/new_password").get_text()
	var confirm_password = get_node("Bar/Top_Menu/Password_Box_Register/Confirm_Password_Box/confirm_password").get_text()
	if new_password == "" and confirm_password == "":
		FLAG_PWD = false
	elif new_password == confirm_password:
		print("entrou aqui")
		password = new_password
		FLAG_PWD = true
	else:
		print("Passwords diferentes")
		FLAG_PWD = false

func clean_password_fields():
	get_node("Bar/Top_Menu/Password_Box_Register/new_password").set_text("")
	get_node("Bar/Top_Menu/Password_Box_Register/Confirm_Password_Box/confirm_password").set_text("")

func _on_ok_button_pressed(): 
	register_password()
	print(FLAG_PWD)
	if FLAG_PWD:
		enter_button.show()
		password_box.show()
		register_button.show()
		password_box_register.hide()
		save_password()
		clean_password_fields()
		print(password)
	else:
		print("senhaa: ", password)
		print("senhas diferentes")

func _on_cancel_button_pressed():
	enter_button.show()
	password_box.show()
	register_button.show()
	password_box_register.hide()
	clean_password_fields()