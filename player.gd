extends CharacterBody2D

# Настройки движения
@export var speed = 300.0
@export var jump_velocity = -400.0

# Получаем значение гравитации из настроек проекта
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# 1. Применяем гравитацию, если персонаж в воздухе
	if not is_on_floor():
		velocity.y += gravity * delta

	# 2. Обработка прыжка
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# 3. Получение направления движения (влево/вправо)
	# Используем стандартные стрелки или WASD (ui_left, ui_right)
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * speed
	else:
		# Плавная остановка
		velocity.x = move_toward(velocity.x, 0, speed)

	# 4. Встроенная функция Godot для перемещения и обработки столкновений
	move_and_slide()
