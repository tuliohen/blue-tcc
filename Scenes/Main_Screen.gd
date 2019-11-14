extends Node


func _ready():
	pass

func _on_Routines_btn_pressed():
	print("routines pressed")
	pass # replace with function body

func _on_Menu_Button_pressed():
	print("menu pressed")
	get_node("Anim_Bar").play("Drop_Bar")
