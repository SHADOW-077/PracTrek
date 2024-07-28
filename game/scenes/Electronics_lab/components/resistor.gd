extends Area2D

var select = false
var menu = false
var resistor_value 
var colors = {
	'black':[0,0,0],'brown':[165,42,42],
	'red':[255,0,0],'orange':[255,165,0],
	'yellow':[255,255,0],'green':[0,128,0],
	'blue':[0,0,255],'violet':[238,130,238],
	'grey':[128,128,128],'white':[255,255,255],
	'gold':[255,215,0],'silver':[192,192,192]
	}
func _process(delta):
	#makes the options visible
	if Input.is_action_just_pressed("r_click"):
		$Control.show()
		$Control.get_tree().paused = false


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		select = true
		$Control.hide()
		$Control.get_tree().paused = false

func _physics_process(delta):
	if select:
		global_position = lerp(global_position,get_global_mouse_position(),27*delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		select = false


func _on_resistance_text_changed(new_text):
	#checks
	if new_text.is_valid_float() == false and new_text.is_empty() == false:
		print('resistance can have numeric value only')
		$Control/Resistance.text = '' 



func _on_resistance_text_submitted(new_text):
	$Control/Resistance.text = new_text
	print(float(new_text))
