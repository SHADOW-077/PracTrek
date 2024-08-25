extends Node2D
var txt_vis = false
var n = 1
var dialogs = ["Welcome to the world of electronics!
 I'm your friendly robot assistant, here to guide you through the
 fascinating world of circuits and components.
 Are you ready to embark on an adventure?","Excellent! 
Let's start with the foundation - batteries.
 Batteries are like the heart of a circuit,
 providing the necessary power for everything to work.
 Can you help me connect these batteries to light up the LED?",
" Excellent!
 Take your time, and make sure the connections are secure.
 Remember, if the connections are loose, the circuit won’t work."]

func _ready() -> void:
	$robot.show_dialog(dialogs[0])

func _on_button_pressed() -> void:
	$robot.hide_dialog()
	$robot.show_dialog(dialogs[n])
	n+=1
	if n==2:
		$Button.text = "Sure"
	$Button.hide()
