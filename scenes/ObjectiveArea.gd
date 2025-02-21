extends Area2D

@onready var win_screen = get_tree().current_scene.find_child("WinScreen", true, false)

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
		win_screen.visible = true
		await get_tree().create_timer(2.0).timeout  # Wait for 2 seconds
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")
