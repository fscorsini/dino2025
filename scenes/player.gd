extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim = $anim as AnimatedSprite2D
var jumpPlayer = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		jumpPlayer = true
	else:
		jumpPlayer = false

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	#print(direction)
	if direction:
		anim.scale.x = direction
		velocity.x = direction * SPEED
		if !jumpPlayer:
			anim.play("run")
		else:
			anim.play("jump")
	else:
		if !jumpPlayer:
			anim.play("idle")
		else:
			anim.play("jump")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if position.y >= 400:
		death()
		
	move_and_slide()
	

func death():
	anim.play("hurt")
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene()
