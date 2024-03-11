extends CharacterBody2D

const speed = 150
const jump = -450
const gravity = 15

var axis: Vector2
var score: int

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func get_axis()-> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	#axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()

func _physics_process(_delta):
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump
	if not is_on_floor():
		velocity.y += gravity
	
	moveCtrl()
	
	var direction = get_axis()
	if direction:
		animationPlayer.play("Walk")
		sprite.flip_h = get_axis().x > 0
	else:
		animationPlayer.play("Idle")
	
	move_and_slide()


func moveCtrl()-> void:
	velocity.x = get_axis().x * speed
	#velocity.y = get_axis().y * -speed

	
	
