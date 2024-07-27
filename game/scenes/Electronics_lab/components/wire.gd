extends Area2D

var current_pt = 1

func _process(delta):
	$wire.set_point_position(current_pt,get_global_mouse_position())
	if Input.is_action_just_pressed("click"):
		$wire.add_point(get_global_mouse_position())
		current_pt += 1
		for i in range(0, $collision_container.get_child_count()):
			$collision_container.get_child(i).queue_free()
		for i in $wire.points.size() - 1:
			var new_shape = CollisionShape2D.new()
			$collision_container.add_child(new_shape)
			var segment = SegmentShape2D.new()
			segment.a = $wire.points[i]
			segment.b = $wire.points[i + 1]
			new_shape.shape = segment
