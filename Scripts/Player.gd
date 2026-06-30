extends CharacterBody2D

@export var speed : float = 300

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("inventory"):
		$InventoryUI.visible = not $InventoryUI.visible
	
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	velocity = direction * speed * delta
	
	move_and_slide()
