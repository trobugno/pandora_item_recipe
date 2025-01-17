@tool
class_name ItemEntity extends PandoraEntity

func get_item_name() -> String:
	return get_string("name")

func get_description() -> String:
	return get_string("description")

func is_stackable() -> bool:
	return get_bool("stackable")
	
func is_cookable() -> bool:
	return get_bool("cookable")
	
func is_craftable() -> bool:
	return get_bool("craftable")
	
func is_growable() -> bool:
	return get_bool("growable")

func get_waste() -> ItemEntity:
	return get_reference("waste") as ItemEntity
