# Markov Machine

This is a simple markov chain library, intended primarily for generating names from a sampleset but simple and extensible to just about anything else you'd like.

Usage is simple - create a new `MarkovMachine` object seeded with your sample data (a string with each entry seperated by a newline), then call `generate_new()` to generate a new output. For example:

```gdscript
	var m = MarkovMachine.new("Sampson\nSamantha")
	print(m.generate_new()) # example outputs: sam, son, sampa, etc...
```

See the `test` folder for a further example. The dataset used for generation is the first name list by elifiner, found here https://gist.github.com/elifiner/cc90fdd387449158829515782936a9a4
