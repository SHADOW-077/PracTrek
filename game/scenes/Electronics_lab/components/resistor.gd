extends Area2D

var select = false
var menu = false

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		select = true

func _physics_process(delta):
	if select:
		global_position = lerp(global_position,get_global_mouse_position(),30*delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		select = false
