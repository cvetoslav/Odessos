extends LineEdit

var my_style = StyleBoxFlat.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	my_style.set_bg_color(Color(2,2,2,0.1))
	set("custom_styles/normal", my_style)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
