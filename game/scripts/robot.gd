extends Area2D


func show_dialog(new_txt):
	$Dialog.text = "ROBOT:" + new_txt
	$Dialog.show()
	for i in range((len(new_txt) +6)):
		if (len(new_txt) +6) != $Dialog.visible_characters:
			$Dialog.visible_characters += 1
			await get_tree().create_timer(.045).timeout
	get_parent().find_child('Button').show()



func hide_dialog():
	$Dialog.visible = false
	$Dialog.visible_characters = 6
