extends Area2D



func glow(state):
	if state == "bright":
		$AnimatedSprite2D.play("glow")
		$PointLight2D.energy = 0.5
	if state == "brighter":
		$AnimatedSprite2D.play("glow")
		$PointLight2D.energy = 1.2
