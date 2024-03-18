extends CharacterBody2D

const speed = 50
const jump = -450
const gravity = 10

@onready var animationEnemy = $AnimationEnemy
@onready var sprite =$Sprite2D
var axis: Vector2
var player

func get_axis()-> Vector2:
	axis.x = velocity.x
	return axis.sign()
	


func _ready():
	player = get_parent().get_node("Player")
	animationEnemy.play("Walk")
	

func _process(_delta):
	if abs(player.position.x - position.x) < 10:
		return
	
	velocity.y += gravity
	
	if player.position.x < position.x:
		velocity.x = -1
	elif player.position.x > position.x:
		velocity.x = 1
	else:
		velocity.x = 0
		
	
	
	
	velocity *= speed
	
	move_and_slide()
	
	var direction = get_axis()
	
	if direction:
		animationEnemy.play("Walk")
		sprite.flip_h = get_axis().x > 0
	else:
		animationEnemy.play("Idle")
		
	
	move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		print("Te han babeado!")
		get_tree().reload_current_scene()
		Global.coins = 0
