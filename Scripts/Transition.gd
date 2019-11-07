extends CanvasLayer

var nextScenePath

func fade_to(path):
	nextScenePath = path
	get_node("Fade Logo").play("Fade Logo")

func change_scene():
	if nextScenePath != null:
		get_tree().change_scene(nextScenePath)