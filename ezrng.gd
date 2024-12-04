extends Node

## Instantiates a new RandomNumberGenerator
##
## @tutorial https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html
var ezrng: RandomNumberGenerator = RandomNumberGenerator.new()

## Sets up a time-based seed for this RandomNumberGenerator instance
##
## @tutorial https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randomize
func _ready() -> void:
	ezrng.randomize()

## Generates "count"-number of integers between the "min" and "max" values
##
## Returns "count"-number of integers in an integer Array
## array_int: Array[int] = [$GeneratedIntegersAppendedHere]
##
## @tutorial https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randi-range
##
## @param count int How many integers should be generated at once?
## @param min int What is the minimum-inclusive integer value to be generated?
## @param max int What is the maximim-inclusive integer value to be generated?
func gen_int(count: int, min: int, max: int) -> Array[int]:
	var arr_int: Array[int] = []
	
	for c in count:
		arr_int.append(ezrng.randi_range(min, max))
	
	return arr_int

## Generates "count"-number of floats between the "min" and "max" values
##
## Returns "count"-number of floats in a float Array
## array_float: Array[float] = [$GeneratedFloatsAppendedHere]
## The preicison of generated floats is based on the "dof" parameter, e.g.:
## "dof" of 10.0 rounds to an integer at the tens-place, 1.0 rounds to an integer at the ones-place, etc.
## "dof" of 0.1 rounds to a float at the tenths-place, 0.01 rounds to a float at the hundredths-place, etc.
## See documentation for @globalscope snapped() for other possible "dof" values
##
## @tutorial https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randf-range
## @tutorial https://docs.godotengine.org/en/stable/classes/class_@globalscope.html#class-globalscope-method-snapped
##
## @param count int How many floats should be generated at once?
## @param min float What is the minimum-inclusive float value to be generated?
## @param max float What is the maximim-inclusive float value to be generated?
## @param dof float To which degree of freedom should these floats be rounded to?
func gen_float(count: int, min: float, max: float, dof: float) -> Array[float]:
	var arr_float: Array[float] = []
	
	for c in count:
		arr_float.append(snapped(ezrng.randf_range(min, max), dof))
	
	return arr_float

## Simulates a statistical normal distribution and generates floats based upon
##
## Assumes the simulation of a statistical normal distribution (Gaussian Distribution)
## Given the mean "avg" and standard deviation "dev", returns "count"-number floats in a float array
## array_float: Array[float] = [$GeneratedFloatsAppendedHere]
## The preicison of generated floats is based on the "dof" parameter
##
## @tutorial https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randfn
##
## @param count int How many floats should be generated at once?
## @param avg float What is the statistical mean of the normal distribution?
## @param dev float What is the statistical standard deviation of the normal distribution?
## @param dof float To which degree of freedom should these floats be rounded to?
func gen_gaussian(count: int, avg: float, dev: float, dof: float) -> Array[float]:
	var arr_float: Array[float] = []
	
	for c in count:
		arr_float.append(snapped(ezrng.randfn(avg, dev), dof))
	
	return arr_float

## Generates "count"-number integers to be used as indices in another data array
##
## Returns "count"-number integers in an integer array
## array_int: Array[int] = [$GeneratedIntegersAppendedHere]
## The supplied "weights" array values are floats indicative of their weights amongst each other
## Higher weight values mean that it is more likely to be chosen
## Weight values of <=0.0 means that it will never be chosen
## The generated integers can then be used to pick a value from your data array, e.g.:
## var data: Array = ["foo", "bar"]
## var weights: PackedFloat32Array = [0.5, 1.5] with "bar" being more likely
## var results: Array[int] = EZRNG.gen_weighted(5, weights)
## Generating "count"-number integers based on the weight will then allow you to select from your data array
## for r in results: print(data[r])
##
## @tutorial https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-rand-weighted
##
## @param count int How many floats should be generated at once?
## @param weights PackedFloat32Array How should your data array's indices be weighted?
func gen_weighted(count: int, weights: PackedFloat32Array) -> Array[int]:
	var arr_int: Array[int] = []
	
	for c in count:
		arr_int.append(ezrng.rand_weighted(weights))
	
	return arr_int
