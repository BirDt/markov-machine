@tool
extends EditorPlugin


func _enter_tree() -> void:
	print("You don't need to enable this plugin, it works just as a library in your resource tree ;)")


func _exit_tree() -> void:
	print("Bye bye! 👋")
