extends Node2D

var resistor = preload("res://game/scenes/Electronics_lab/components/resistor.tscn")
var wire = preload("res://game/scenes/Electronics_lab/components/wire.tscn")
@onready var spawn_pos = $Marker2D.global_position

func _on_button_pressed():
	var resistor_inst = resistor.instantiate()
	resistor_inst.position = spawn_pos
	$res_container.add_child(resistor_inst)


func _on_button_2_pressed():
	var wire_inst = wire.instantiate()
	$wire_container.add_child(wire_inst)
