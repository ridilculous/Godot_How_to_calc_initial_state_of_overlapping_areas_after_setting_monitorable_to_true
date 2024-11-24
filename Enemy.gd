extends AnimatableBody2D
class_name Enemy

@onready var hit_area = $PhysicalHitArea

@export var physical_cooldown_time_sec : float = .5
var physical_cooldown_at : float = 0

var gameClock = 0.
func _physics_process(_delta):
	var collision = move_and_collide(Vector2.ZERO)

	gameClock += _delta
	if hit_area != null && gameClock >= physical_cooldown_at:
		#print("test hit area at ", gameClock)
		var hit_area_overlapping_areas = hit_area.get_overlapping_areas()
		#print("hit_area.monitoring = ", hit_area.monitoring)
		if hit_area_overlapping_areas.size() > 0:
			#print("nof overlapping areas = ", hit_area_overlapping_areas.size())
			physical_cooldown_at = gameClock + physical_cooldown_time_sec
			for hurt_box in hit_area_overlapping_areas:
				hurt(hurt_box.get_parent())

func hurt(that):
	that.modulate.a = fmod(that.modulate.a + .7, 1.)
