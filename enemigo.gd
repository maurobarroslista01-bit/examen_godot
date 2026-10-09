extends CharacterBody2D


const SPEED = 200.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if velocity.x == 0:
		velocity.x = SPEED * (-1)
	
	if $RayCast2D.is_colliding():
		velocity.x = SPEED * (-2)
	else:
		velocity.x = SPEED * (-1)
	move_and_slide()

func _on_area_superior_body_entered(body: Node2D) -> void:
	queue_free()
