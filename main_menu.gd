extends Control

# Укажите путь к сцене с вашим уровнем
@export var game_scene_path : String = "res://levels/lobby.tscn"

func _on_start_button_pressed():
	# Переход к игровой сцене
	get_tree().change_scene_to_file(game_scene_path)

func _on_quit_button_pressed():
	# Закрытие игры
	get_tree().quit()
