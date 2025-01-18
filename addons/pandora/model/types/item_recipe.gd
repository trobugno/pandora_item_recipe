extends PandoraPropertyType

const SETTING_CATEGORY_FILTER = "Category Filter"
const SETTING_MIN_VALUE = "Min Quantity"
const SETTING_MAX_VALUE = "Max Quantity"
const SETTINGS = {
	SETTING_CATEGORY_FILTER: {"type": "reference", "value": ""},
	SETTING_MIN_VALUE: {"type": "int", "value": -9999999999},
	SETTING_MAX_VALUE: {"type": "int", "value": 9999999999}
}

func _init() -> void:
	super("item_recipe", SETTINGS, {"item": null, "quantity": 0}, "res://assets/ui/editor/node/icon_parchment.png")

func parse_value(variant: Variant, settings: Dictionary = {}) -> Variant:
	print("item_recipe::parse_value\n\t[ variant ] >> ", variant)
	if variant is Dictionary:
		print("\t[all_entities] >> ", Pandora.get_all_entities())
		var reference = PandoraReference.new(variant["item"]["_entity_id"], PandoraReference.Type.ENTITY).get_entity()
		print("\t[ reference ] >> ", reference)
		
		var value : Dictionary = {
			"item": reference,
			"quantity": int(variant["quantity"])
		}
		return value
	return variant

func write_value(variant: Variant) -> Variant:
	if variant is Dictionary:
		var copy_variant = variant.duplicate()
		var item_entity = copy_variant["item"] as ItemEntity
		
		var reference = PandoraReference.new(item_entity.get_entity_id(), PandoraReference.Type.ENTITY)
		copy_variant["item"] = reference.save_data()
		return copy_variant
	return variant

func is_valid(variant: Variant) -> bool:
	if variant is Dictionary:
		var dictionary = variant as Dictionary
		var valid = dictionary.has("item") and dictionary.get("item") != null and dictionary.get("item") is PandoraEntity and dictionary.has("quantity")
		print("item_recipe::is_valid\n\t[ valid ] >> ", valid)
		return valid
	return false
