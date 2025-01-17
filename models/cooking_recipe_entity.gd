@tool
class_name CookingRecipeEntity extends RecipeEntity

func get_waste() -> ItemEntity:
	return get_reference("waste") as ItemEntity

func get_recipe() -> Array[SlotResource]:
	var item_recipes : Array[SlotResource] = []
	var recipe = get_array("recipe") as Array[Dictionary]
	for item_recipe : Dictionary in recipe:
		var slot_resource := SlotResource.new()
		slot_resource.quantity = item_recipe["quantity"]
		slot_resource.item = Pandora.get_entity(item_recipe["item"])
		item_recipes.append(slot_resource)
	return item_recipes
