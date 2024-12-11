extends Node

var ezrng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	ezrng.randomize()

func gen_int(count: int, min: int, max: int) -> Array[int]:
	var arr_int: Array[int] = []
	
	for c in count:
		arr_int.append(ezrng.randi_range(min, max))
	
	return arr_int

func gen_float(count: int, min: float, max: float, dof: float) -> Array[float]:
	var arr_float: Array[float] = []
	
	for c in count:
		arr_float.append(snapped(ezrng.randf_range(min, max), dof))
	
	return arr_float

func gen_gaussian(count: int, avg: float, dev: float, dof: float) -> Array[float]:
	var arr_float: Array[float] = []
	
	for c in count:
		arr_float.append(snapped(ezrng.randfn(avg, dev), dof))
	
	return arr_float

func gen_weighted(count: int, weights: PackedFloat32Array) -> Array[int]:
	var arr_int: Array[int] = []
	
	for c in count:
		arr_int.append(ezrng.rand_weighted(weights))
	
	return arr_int
