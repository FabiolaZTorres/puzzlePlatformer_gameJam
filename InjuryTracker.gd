class_name InjuryTracker extends Area2D
#Tracks damage taken

@export var injury_effects : Array[EmptyEffect]
@export var invulnerable : bool = false

signal on_injured (injury : float)
signal on_killed()

#Tracks amount of damage taken when hit.
func on_hit(injury_amount : float):
	injury(injury_amount)

#changes health values based on damage taken and checks for death.
func injury(injury_amount : float):
	if is_dead() : return;
	if invulnerable : return; 
	
	on_injured.emit(injury_amount)
	set_hp(get_hp() - injury_amount)
	for e in injury_effects:
		if e == null : return
		e.trigger(self)
	
	if is_dead():
		on_killed.emit()

func is_dead() -> bool:
	return get_hp() <= 0.0
	
func get_hp() -> float:
	return 0.0
	
func set_hp(hp : float) :
	pass
