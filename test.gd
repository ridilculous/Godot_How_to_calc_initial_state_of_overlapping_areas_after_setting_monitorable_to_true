extends Node2D

class_name Test

@export var enemy1: PackedScene
@export var tower1: PackedScene

func spawn_enemy(enemy_scene : PackedScene, entity_position : Vector2):
	var new_instance = enemy_scene.instantiate()
	new_instance.global_position = entity_position
	add_child(new_instance)
	return new_instance
func spawn_tower(tower_scene : PackedScene, entity_position : Vector2):
	var new_instance = tower_scene.instantiate()
	new_instance.global_position = entity_position
	add_child(new_instance)
	return new_instance

var e
var t
var s : int = 0
func nxt4():
	s += 1
	print(s)
	match s:
		1: 
			e = spawn_enemy(enemy1, Vector2(500,500))
			t = spawn_tower(tower1, Vector2(600,500))
			t.hurt_area.monitorable = false
		2:
			t.global_position = Vector2(550,500)
		3:
			t.hurt_area.monitorable = true

			# --> enable these three lines to fix the issue and make hit_area.get_overlapping_areas return a non empty array
			#var op = t.global_position
			#t.global_position = Vector2(600,500)
			#get_tree().create_timer(.0).connect("timeout", func (): t.global_position = op, ConnectFlags.CONNECT_ONE_SHOT)

			t.modulate.g = .5
		5: t.global_position = Vector2(600,500)
		6:
			t.global_position = Vector2(550,500)
			s = 4

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				nxt4()
				pass
	elif event is InputEventMouseMotion:
		#if t != null:
		#	t.global_position = get_viewport().get_mouse_position()
		pass
