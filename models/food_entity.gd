@tool
class_name FoodEntity extends ItemEntity

func get_heal_value() -> int:
	return get_integer("heal_value")

func get_mana_value() -> int:
	return get_integer("mana_value")

func get_energy_value() -> int:
	return get_integer("energy_value")
