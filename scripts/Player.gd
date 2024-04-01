extends CharacterBody2D

const speed = 150
const jump = -450
const gravity = 15

var axis: Vector2
var score: int

var motion = Vector2()
var lifes = 3

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func get_axis()-> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	#axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()

func _physics_process(_delta):
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump
		$ASP2DPlayerJump.play()
	if not is_on_floor():
		velocity.y += gravity
	
	moveCtrl()
	
	var direction = get_axis()
	if direction:
		animationPlayer.play("Walk")
		sprite.flip_h = get_axis().x < 0
	else:
		animationPlayer.play("Idle")
	
	move_and_slide()


func moveCtrl()-> void:
	velocity.x = get_axis().x * speed
	#velocity.y = get_axis().y * -speed

func _loseLife(enemy2Position):
	var enemy2PosX = enemy2Position
	#print(enemy2PosX)
	#print(position.x)
	
	$ASP2DPlayerGetDamaged.play()
	
	if position.x < enemy2PosX:
		velocity = Vector2(-500, -300)
		
	elif position.x > enemy2PosX:
		velocity = Vector2(500, -300)
		
		#PROBLEMA: No rebota en X.
	
	lifes = lifes - 1
	print("Vida actual: " + str(lifes))
	
	if lifes <= 0:
		$ASP2DPlayerDead.play()
		
		await get_tree().create_timer(0.1).timeout
		
		get_tree().reload_current_scene()
		Global.coins = 0
	
	elif lifes == 2:
		$"../CanvasLayer/Heart3".visible = !visible
	
	elif lifes == 1:
		$"../CanvasLayer/Heart2".visible = !visible
	
	#Global.handleHearts(lifes)
	
	print("Te han herido")
	
	

