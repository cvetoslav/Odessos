extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()


func _physics_process(delta):
	pass
	
func change_dir(deg):
	rotation_degrees = deg
	
