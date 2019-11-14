extends Node

var password = ""

func _ready():
	pass

func _on_Routines_btn_pressed():
	print("routines pressed")
	pass # replace with function body

func _on_Menu_Button_pressed():
	print("menu pressed")
	get_node("Anim_Bar").play("Drop_Bar")


func _on_Register_button_pressed():
	print("register pressed")
	pass # replace with function body


func _on_Enter_Button_pressed():
	password = get_node("Bar/Top_Menu/ColorFrame/LineEdit").get_text()
	print(password)
