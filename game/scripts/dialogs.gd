extends MarginContainer

signal dialog_no(dialogue_no)
var list
var letter_id = 0
var dialogue_id = 0
var dictionary
var next_dialogue = false
var stop_dialog = false

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("click") || event.is_action_pressed("enter")) && visible == true && next_dialogue:
		print(event)
		next_dialogue = false
		$margin/Dialog.text = " "
		letter_id = 0
		if dialogue_id < len(list)-1:
			dialogue_id +=1
			emit_signal("dialog_no",dialogue_id)
		elif dialogue_id == len(list)-1:
			hide()
func _ready() -> void:
	var file = FileAccess.open("res://game/scripts/file/dialogues.json", FileAccess.READ)
	var text = file.get_as_text()
	dictionary = JSON.parse_string(text)

func show_dialog(level):
	stop_dialog = false
	list = dictionary[level]
	$margin/Dialog.text = " " 
	show()

func show_letters():
	if len(list[dialogue_id]) > letter_id:
		$margin/Dialog.text += list[dialogue_id][letter_id]
		letter_id += 1
		if len(list[dialogue_id]) == letter_id:
			next_dialogue = true

func _on_timer_timeout() -> void:
	show_letters()

func pause_dialog(dialog_no):
		stop_dialog = true
		hide()
