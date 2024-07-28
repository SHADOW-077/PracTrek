extends Area2D

@onready var menu = $menu
@onready var resistor_text = $menu/Resistance
@onready var bandnode_1 = $color_band/band_1
@onready var bandnode_2 = $color_band/band_2
@onready var bandnode_3 = $color_band/band_3
@onready var bandnode_4 = $color_band/band_4
var select = false
var resistance_with_nounit = 470
var resistor_unit = 1
var resistor_value = 470 * resistor_unit
var list


var colors = {
	'black':[0,0,0],'brown':[165,42,42],
	'red':[255,0,0],'orange':[255,165,0],
	'yellow':[255,255,0],'green':[0,128,0],
	'blue':[0,0,255],'violet':[155,38,182],
	'grey':[128,128,128],'white':[255,255,255],
	'gold':[255,215,0],'silver':[192,192,192]
	}

var digit_color = {'0': 'black',
	'1': 'brown',
	'2': 'red',
	'3': 'orange',
	'4': 'yellow',
	'5': 'green',
	'6': 'blue',
	'7': 'violet',
	'8': 'grey',
	'9': 'white'
	}

func _process(delta):
	#makes the options visible
	if Input.is_action_just_pressed("r_click"):
		menu.show()
		menu.get_tree().paused = false
	get_unit()
	resistor_value = resistance_with_nounit * resistor_unit
	if Input.is_action_just_pressed('enter'):
		set_colorband()



func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		select = true
		menu.hide()
		menu.get_tree().paused = false

func _physics_process(delta):
	if select:
		global_position = lerp(global_position,get_global_mouse_position(),27*delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		select = false


func _on_resistance_text_changed(new_text):
	#checks if the resistane is float else it becomes empty
	if new_text.is_valid_float() == false and new_text.is_empty() == false:
		print('resistance can have numeric value only')
		resistor_text.text = '' 

func _on_resistance_text_submitted(new_text):
	resistor_text.text = new_text
	resistance_with_nounit = float(new_text)

func get_unit():
	if $menu/OptionButton.get_selected_id() == 0:
		resistor_unit = 1
		set_colorband()
	if $menu/OptionButton.get_selected_id() == 1:
		resistor_unit = 1000
	set_colorband()

func set_colorband():
	list = []
	for i in str(resistor_value):
		if i == '.':
			list.append(i)
		else:
			list.append(float(i))
	if str(list[0]) == '.':
		list.insert(0,0)
	if str(list[0]) in digit_color:
		var colorband_1 = digit_color.get(str(list[0]))
		var colorcode_1 = colors.get(colorband_1)
		var x = colorcode_1[0]
		var y = colorcode_1[1]
		var z = colorcode_1[2]
		bandnode_1.set_color(Color(x,y,z,1))
	if str(list[1]) in digit_color:
		var colorband_2 = digit_color.get(str(list[1]))
		var colorcode_2 = colors.get(colorband_2)
		var x = colorcode_2[0]
		var y = colorcode_2[1]
		var z = colorcode_2[2]
		bandnode_2.set_color(Color(x,y,z,1))
	if len(list) >=3 and str(list[2]) in digit_color:
		var colorband_3 = digit_color.get(str(list[2]))
		var colorcode_3 = colors.get(colorband_3)
		var x = colorcode_3[0]
		var y = colorcode_3[1]
		var z = colorcode_3[2]
		bandnode_3.set_color(Color(x,y,z,1))

