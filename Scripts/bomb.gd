extends RigidBody2D

#var TilebDetection = preload("res://scenes_/tile_detection_.tscn")

func _on_area_2d_bomb_body_exited(body: Node2D) -> void:
	pass 
	
	##check if the body is the player
	#if body is player:
		## enable the collision bomb
		#set_collision_mask_value(1, true)


func _on_timer_timeout() -> void:
	# delete the bomb
	queue_free()
	
	# spawn the tile detection
	#Spawn_Tile_Detection()

#func Spawn_Tile_Detection():
	
	# set the tile detection position to the bomb position
	#TileDetection.global_position = global_position
	
	# add it to the scene tree
	#get_tree().root.add_child()
	
	
	
