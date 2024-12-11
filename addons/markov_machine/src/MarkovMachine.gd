extends Object
class_name MarkovMachine

var occurences : Dictionary = {}
var lengths : Dictionary = {}

func add_occurence(previous : String, occ : String):
	if not previous in occurences.keys():
		occurences[previous] = {}
	if not occ in occurences[previous].keys():
		occurences[previous][occ] = 1
	else:
		occurences[previous][occ] += 1

func add_length(key : int):
	if not key in lengths.keys():
		lengths[key] = 1
	else:
		lengths[key] += 1

func pick_weighted(dictionary : Dictionary):
	var sum_weights = 0
	for i in dictionary.keys():
		sum_weights += dictionary[i]
	
	var rnd = randi_range(0, sum_weights - 1)
	
	for i in dictionary.keys():
		if rnd < dictionary[i]:
			return i
		rnd -= dictionary[i]

func _init(seed_text: String):
	var lines = seed_text.split("\n", false)
	for i in lines:
		var chars = i.split()
		add_length(len(chars))
		for j in len(chars):
			if j == 0:
				add_occurence("", chars[j].to_lower())
			else:
				add_occurence(chars[j-1].to_lower(), chars[j].to_lower())

func generate_new():
	var result = ""
	while result == "":
		result = pick_weighted(occurences[""])
	
	var length = pick_weighted(lengths)
	
	while true:
		var generated_result = pick_weighted(occurences[result[-1]])
		if len(result) == length:
			return result
		result += generated_result
