extends Button

@export var myName: String
@export  var texture: Texture2D
@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	texture_rect.texture = texture

#func _process(delta: float) -> void:

func _get_drag_data(at_position:Vector2)->Variant:
	print_debug(at_position)
	var item := "THE ITEM"
	#if item == null: return null
	
	var drag_data = ItemDrag.new(self, item, _create_item_preview(item))
	set_drag_preview(drag_data.preview)

	return drag_data
	
func _can_drop_data(at_position:Vector2, data:Variant)->bool:
	print_debug("Can Drop " , myName,  at_position)
	return true
func _drop_data(at_position:Vector2, data:Variant)->void:
	print("Dropped", myName)
	
func _create_item_preview(item):
	var textureRect = TextureRect.new()
	textureRect.texture = texture
	return textureRect
