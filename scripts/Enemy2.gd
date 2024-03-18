extends CharacterBody2D

const speed = 75
const jump = -450
const gravity = 15

@onready var animationEnemy2 = $AnimationEnemy2
@onready var sprite =$Sprite2D
var axis: Vector2
var moving_left = true
var player

func _ready():
	player = get_parent().get_node("Player")
	animationEnemy2.play("Walk")
	

func _process(_delta):
	velocity.y += gravity
	
	if (moving_left):
		velocity.x = -speed
		move_and_slide()
	else:
		velocity.x = speed
		move_and_slide()
		
	
	turn()
	
	
	

func turn():
	if not $RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x
		


func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		print("Te han babeado!")
		body._loseLife(position.x)
		#Global.handleHearts(1)
		pass
		
