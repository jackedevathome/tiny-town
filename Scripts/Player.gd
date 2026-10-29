extends CharacterBody2D

@export var speed : float = 130

func _ready() -> void:
	LimboConsole.register_command(teleport)

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("inventory"):
		$InventoryCanvas.visible = not $InventoryCanvas.visible
	
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	velocity = direction * speed
	
	move_and_slide()

func teleport(pos_x, pos_y):
	global_position = Vector2(pos_x, pos_y)
