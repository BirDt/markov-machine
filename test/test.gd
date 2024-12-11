extends Node

func _ready() -> void:
	var file = FileAccess.open("res://test/names.txt", FileAccess.READ)
	var content = file.get_as_text()
	
	var m = MarkovMachine.new(content)
	print(m.generate_new())
