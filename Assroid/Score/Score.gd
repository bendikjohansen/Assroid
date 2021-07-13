extends Label

const UFO_SCORE = 200
const ASTEROID_SCORE = 50
const PADDED_ZEROS = 8

var score = 0

func _ready():
	_increment_score(0)

func _on_Ufo_ufo_killed_by_player():
	_increment_score(UFO_SCORE)
	
func _on_Asteroid_asteroid_exploded_by_player():
	_increment_score(ASTEROID_SCORE)
	
func _increment_score(additional_score: int):
	score += additional_score
	
	set_text(str(score).pad_zeros(PADDED_ZEROS))
