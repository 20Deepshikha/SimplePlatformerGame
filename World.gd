extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/Panel2.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass






func _on_Goal_body_entered(body):
	print('abcd')
	$HUD/Panel2.show()
	
	


func _on_KillPlane_body_entered(body):
	body.position.x = 30
	body.position.y = 200
