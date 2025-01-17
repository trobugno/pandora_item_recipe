@tool
class_name RecipeEntity extends PandoraEntity

func get_result() -> ItemEntity:
	return get_reference("result") as ItemEntity

func get_description() -> String:
	return get_string("description")
