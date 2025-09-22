extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	var scene = get_tree().current_scene
	#print(scene.name)
	if scene.name == "main" and body.name == "player":
		get_tree().change_scene_to_file("res://scenes/fase_02.tscn")
	elif scene.name == "fase02" and body.name == "player":
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	
	
