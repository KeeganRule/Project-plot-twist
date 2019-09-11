extends KinematicBody

var gravity = -12
var speed = 10
var jump_speed = 6
var spin = 0.1



var velocity = Vector3()
var jump = false


func get_input():
	jump = false
	if Input.is_action_just_pressed("jump"):
		jump = true
	
	
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("Move_foward"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("Move_back"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("Strafe_right"):
		velocity += transform.basis.x * speed
	if Input.is_action_pressed("Strafe_left"):
		velocity += -transform.basis.x * speed
	velocity.y = vy


func _physics_process(delta):
	if jump and is_on_floor():
		velocity.y = jump_speed

	
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
 
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, spin, event.relative.x/10))
		elif event.relative.x <0:
			rotate_y(-lerp(0, spin, event.relative.x/10))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
