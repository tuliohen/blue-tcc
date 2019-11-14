extends Node

var password = ""

var save_file = File.new()
var save_path = "res://savegame.save"
var save_data = {"password": ""}

onready var enter_button = get_node("Bar/Top_Menu/Enter_Button")
onready var password_box = get_node("Bar/Top_Menu/Password_Box")
onready var register_button = get_node("Bar/Top_Menu/Register")
onready var password_box_register = get_node("Bar/Top_Menu/Password_Box_Register")

func _ready():
	print("password atual é: ", password)
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
	print("routines pressed")
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
	password = get_node("Bar/Top_Menu/Password_Box/current_password").get_text()
	print(password)

func _on_Cancel_btn_pressed():
	get_node("Anim_Bar").play("Up_Bar")

func _on_ok_button_pressed():
	enter_button.show()
	password_box.show()
	register_button.show()
	password_box_register.hide()
	password = get_node("Bar/Top_Menu/Password_Box_Register/new_password").get_text()
	print("ok pressed")
	save_password()
	print(password)
	pass # replace with function body
