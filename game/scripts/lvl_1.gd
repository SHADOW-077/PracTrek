extends Node2D

var dialog_to_be_paused = [10]
func _ready() -> void:
	$dialogs.show_dialog("level_1")
