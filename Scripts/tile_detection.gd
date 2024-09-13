extends Area2D

# use control to drag and drop
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var right_explosion: AnimatedSprite2D = $RightTile/RightExplosion
@onready var right_tile_explosion: AnimatedSprite2D = $RightTile/RightTileExplosion
@onready var left_explosion: AnimatedSprite2D = $LeftTile/LeftExplosion
@onready var left_tile_explosion: AnimatedSprite2D = $LeftTile/LeftTileExplosion
@onready var up_explosion: AnimatedSprite2D = $UpTile/UpExplosion
@onready var up_tile_explosion: AnimatedSprite2D = $UpTile/UpTileExplosion
@onready var down_explosion: AnimatedSprite2D = $DownTile/DownExplosion
@onready var down_tile_explosion: AnimatedSprite2D = $DownTile/DownTileExplosion

var light = false
var left = false
var up = false
var down = false

var SpawnChance = 0.2

var SpawnItem = [
	preload("res://Scenes/increase_speed.tscn"),
	preload("res://Scenes/more_bomb.tscn")
]

func Spawn_Pick_Up_():
	
	# check os the spawn chance is greater than random outcome of ran
	if SpawnChance > randf():
		
			# randomise the spawn items
			var SpawnRandom = SpawnItem[randi() % SpawnItem.size()]
			
			# ceate an instance of the spawn random
			var SpawnInstance = SpawnRandom.instantiate()
			
			# set the Spawn instance posistion to the tile detecion position
			SpawnInstance.global_position = global_position
			
			# add it as a child to the scene 
			get_tree().root.call_deferred("add_child", SpawnInstance)


func _on_right_tile_area_entered(area: Area2D):
	pass # Replace with function body.


func _on_right_tile_body_entered(body: Node2D):
	_on_body_entered(body)


func _on_left_tile_area_entered(area: Area2D):
	pass # Replace with function body.


func _on_left_tile_body_entered(body: Node2D):
	_on_body_entered(body)


func _on_up_tile_area_entered(area: Area2D):
	pass # Replace with function body.


func _on_up_tile_body_entered(body: Node2D):
	_on_body_entered(body)


func _on_down_tile_area_entered(area: Area2D):
	pass # Replace with function body.


func _on_down_tile_body_entered(body: Node2D):
	_on_body_entered(body)


func _on_animated_sprite_2d_animation_finished():
	
	#check if the animation has finished playing
	if animated_sprite_2d.animation == "default":
		
		# delete the game object
		queue_free()


func _on_area_entered(area: Area2D):
	if area.collision_layer == 8:
		print("boom")
		#area.get_parent().visible = false 
		animated_sprite_2d.visible = true
		
func _on_body_entered(body: Node2D):
	if body is TileMapLayer:
		print("TILE COLLISION: ", position)
		var tile_map = body as TileMapLayer
		var world_2d = tile_map.get_world_2d()
		
		
		# Now you have the tile ID that was collided with!
		#if tile_data != null:
			#print("Collided with tile ID:", tile_data)
