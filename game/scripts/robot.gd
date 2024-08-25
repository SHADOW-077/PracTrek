extends Area2D


func show_dialog(new_txt):
	$dialogs/margin/Dialog.text = "ROBOT:" + new_txt
	$dialogs.show()
	for i in range((len(new_txt) +6)):
		if (len(new_txt) +6) != $dialogs/margin/Dialog.visible_characters:
			$dialogs/margin/Dialog.visible_characters += 1
			await get_tree().create_timer(.045).timeout
	get_parent().find_child('Button').show()



func hide_dialog():
	$dialogs.hide()
	$dialogs/margin/Dialog.visible_characters = 6
