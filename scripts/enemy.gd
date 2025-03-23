extends CharacterBody2D

enum Detection {
	Undetected,
	Searching,
	Found
}

const SPEED = 300.0
const ACCEL = 2.0
var lastKnownLocation;
var alertLevel: Detection = Detection.Undetected;

#func set_state(new_state: int) -> void:
	#var previous_state := state;
	#state = new_state

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO;
	velocity = direction * SPEED;
	


func _on_vision_timer_timeout() -> void:
	var overlaps = $Vision.get_overlapping_bodies();
	$VisionRaycast.scale = $Vision/LineOfSight.scale;
	if(overlaps.size() > 0):
		for overlap in overlaps:
			if(overlap.name == "Enemy") :
				continue;
			if(overlap.name == "Player"):
				var playerPos = overlap.global_position;
				$VisionRaycast.look_at(playerPos);
				$VisionRaycast.force_raycast_update();
				
				print("Looking at: ", $VisionRaycast.target_position);
				print("Player Pos: ", playerPos);
				
				if $VisionRaycast.is_colliding():
					var collider = $VisionRaycast.get_collider();
					
					if collider.name == "Player":
						$VisionRaycast.modulate = Color(150, 0, 0);
						alertLevel = Detection.Found;
						print("Found");
						print("I can see you");
					else:
						$VisionRaycast.modulate = Color(0, 255, 0);
						alertLevel = Detection.Undetected;
						print("I can't see you");
