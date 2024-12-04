
# EZ RNG

EZ RNG simplifies your RNG needs by offering the following global functions via a sole, auto-loaded singleton script:

gen_int() - Generates integers in an array inclusively-between minimum and maximum values

gen_float() - Generates floats in an array inclusively-between minimum and maximum values

gen_gaussian() - Simulates a statistical normal distribution and generates numbers thereof

gen_weighted() - Uses float-based weights for generation with favorability


## Badges

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/license/mit)
[![GitHub](https://img.shields.io/badge/GitHub-Repo-gold.svg)](https://github.com/aaron-tundrapeaksstudios/EZ-RNG)
[![AssetLib](https://img.shields.io/badge/Godot-AssetLib-red.svg)](https://godotengine.org/asset-library/asset)
[![Godot 4.x](https://img.shields.io/badge/Godot-4.x-blue.svg)](https://godotengine.org/)
[![Godot GDScript](https://img.shields.io/badge/Godot-GDScript-purple.svg)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html)
## Installation

Install from the Godot editor's AssetLib

```
  1.) Click on "AssetLib" at the top-middle of the editor
  2.) Search for "EZ RNG" without double-quotes
  3.) Click on "EZ RNG"
  4.) Click "Download"
  5.) Click "Install"
  6.) Navigate to Project -> Project Settings -> Plugins and check the "On" box 
  7.) Call the EZ RNG functions anywhere in the rest of your project's GDScript scripts via:
    7.1.) EZRNG.gen_int()
    7.2.) EZRNG.gen_float()
    7.3.) EZRNG.gen_gaussian()
    7.4.) EZRNG.gen_weighted()
```

Install from the .zip file

```
  1.) Download and un-zip the addons folder from this repo
  2.) If your project doesn't yet have an addons folder, create one in the root of res://
    2.1.) res:// structure should be res://addons/ez_rng/$contents
    2.2.) If you already have an addons folder, just paste the ez_rng folder into it
  3.) Navigate to Project -> Project Settings -> Plugins and check the "On" box
  4.) Call the EZ RNG functions anywhere in the rest of your project's GDScript scripts via:
    4.1.) EZRNG.gen_int()
    4.2.) EZRNG.gen_float()
    4.3.) EZRNG.gen_gaussian()
    4.4.) EZRNG.gen_weighted()
```
    
## Usage

#### EZRNG.gen_int()

```gdscript
  EZRNG.gen_int(count: int, min: int, max: int) -> Array[int]

  ## e.g. Generate 10 integers between 1 and 10:

  var my_int_array: Array[int] = EZRNG.gen_int(10, 1, 10)
```

| Parameters | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `count` | `int` | **Required**. How many integers to generate |
| `min` | `int` | **Required**. Minimum-inclusive integer value |
| `max` | `int` | **Required**. Maximum-inclusive integer value |

| Returns | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `arr_int` | `Array[int]` | An integer array containing all generated values |

#### EZRNG.gen_float()

```gdscript
  EZRNG.gen_float(count: int, min: float, max: float, dof: float) -> Array[float]

  ## e.g. Generate 5 floats between 1.0 and 20.0, rounded to the hundredths-place:

  var my_float_array: Array[float] = EZRNG.gen_float(10, 1.0, 20.0, 0.01)
```

| Parameters | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `count` | `int` | **Required**. How many floats to generate |
| `min` | `float` | **Required**. Minimum-inclusive float value |
| `max` | `float` | **Required**. Maximum-inclusive float value |
| `dof` | `float` | **Required**. How many degrees of freedom to round values |

| Returns | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `arr_float` | `Array[float]` | A float array containing all generated values |

#### EZRNG.gen_gaussian()

```gdscript
  EZRNG.gen_gaussian(count: int, avg: float, dev: float, dof: float) -> Array[float]

  ## e.g. Simulate a normal distribution with a mean of 20 and standard deviation of 2.5.
  ## Return 40 sampled values thereof, rounded to the tenths-place:

  var my_gaussian_array: Array[float] = EZRNG.gen_gaussian(40, 20.0, 2.5, 0.1)
```

| Parameters | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `count` | `int` | **Required**. How many floats to generate |
| `avg` | `float` | **Required**. The statistical mean of the normal distribution |
| `dev` | `float` | **Required**. The standard deviation of the normal distribution |
| `dof` | `float` | **Required**. How many degrees of freedom to round values |

| Returns | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `arr_float` | `Array[float]` | A float array containing all generated values |

#### EZRNG.gen_weighted()

```gdscript
  EZRNG.gen_weighted(count: int, weights: PackedFloat32Array) -> Array[int]

  ## e.g. Consider the weights [-1.0, 0.0, 0.5, 1, 2, 4]
  ## Neither -1.0 nor 0.0 will ever be chosen since they are <=0.0.
  ## 4 is the most-likely to be chosen, 0.5 is the least-likely.
  ## Return 20 index position integers based on these weights:

  var my_weights: PackedFloat32Array = [-1.0, 0.0, 0.5, 1, 2, 4]
  var my_weighted_array: Array[int] = EZRNG.gen_weighted(20, my_weights)
```

| Parameters | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `count` | `int` | **Required**. How many integers to generate |
| `weights` | `PackedFloat32Array` | **Required**. The weights to be considered during generation |

| Returns | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `arr_int` | `Array[int]` | An integer array containing all generated values |

## Usage/Examples

If working on a Pen n' Paper RPG type of application, you could roll dice:
```gdscript
## Roll 1d20
var d20_result: int = EZRNG.gen_int(1, 1, 20)[0]

## Roll 2d20
var d20_result: Array[int] = EZRNG.gen_int(2, 1, 20)

## Roll 1d100
var d100_result: int = EZRNG.gen_int(1, 1, 100)[0]

## Roll 2d100
var d20_result: Array[int] = EZRNG.gen_int(2, 1, 100)

## Sample advantage 1d20 roll
var adv: int = EZRNG.gen_int(2, 1, 20).max()

## Sample disadvantage 1d20 roll:
var dis: int = EZRNG.gen_int(2, 1, 20).min()
```

If you want to add weighting to your number generation to grant favorability:
```gdscript
## Specify an array of things you want to be picked with favorability
var favorite_snacks: Array[String] = ["apple", "cookie", "ice cream"]

## Specify the weights, or, favorability of these things in the same order
## e.g. I like cookies twice as much as apples, and ice cream twice as much as cookies
var snack_weights: PackedFloat32Array = [0.5, 1.0, 2.0]

## Let's say I want to buy snacks for the next two weeks, eating one per day
## This means we want 14 random values to be generated to then align with the snack indices
var weight_results: Array[int] = EZRNG.gen_weighted(14, snack_weights)

## The weight_results array will favor ice cream but still pick apples and cookies
## Now we combine the weight_results and favorite_snacks to see what to buy
var snack_purchase: Array[String] = []
for result in weight_results:
    snack_purchase.append(favorite_snacks[result])
```

If you need to generate numbers with decimal values you can do so specifying degrees of freedom:
```gdscript
## Generate a random enemy's wallet with a loot table of $3.50 to $100.00
var loot_wallet: float = EZRNG.gen_float(1, 3.5, 100.0, 0.01)

## For even more precise decimal places, modify the Degrees of Freedom "dof"
var hundred_thousandth_rng: float = EZRNG.gen_float(1, 0.0, 50.0, 0.00001)

## To loot the enemy's wallet above to the nearest dollar, specify 1 for "dof"
var rounded_loot_wallet: int = EZRNG.gen_float(1, 3.5, 100.0, 1)

## Likewise for the nearest ten-dollars, specify 10 for "dof"
var rounded_loot_wallet: int = EZRNG.gen_float(1, 3.5, 100.0, 10)

## And likewise for the nearest ten-cents, specify 0.1 for "dof"
var rounded_loot_wallet: int = EZRNG.gen_float(1, 3.5, 100.0, 0.1)
```

If you want to generate values based on a statistical model, supply the mean and standard deviation for Box-Muller generation:
```gdscript
## Let's say a JRPG wants to add some dynamicism to enemy stats
## The typical same-level enemy has an average health of 1200, discrete integer values only
## The developer wants there to be a common variance (1 standard deviation, 68%) of ~200
## When generating 10 enemies in the game, lets give them some dynamic health values
var enemy_health: Array[int] = EZRNG.gen_gaussian(10, 1200.0, 200.0, 1)

## From here when constructing the enemies the developer can loop through health assignment
for enemy in enemies:
    enemy.set_health(enemy_health[enemy])
```
## FAQ

#### Is this plugin truly necessary for RNG?

No, but with most RNG needs boiling down to needing X-number of generated values between minimum-Y and maximum-Z, this plugin grants quick global-level RNG availability. I've built similar standalone RNG nodes to accomplish similar, but a plugin available at the global-level, eliminating the hussle of node management thereof, makes it even quicker especially when encountering circumstances where you need to re-instantiate RandomNumberGenerator objects time-to-time at runtime. The actual line-of-code count of this plugin is 24 ignoring documentation, but if you want to modify it or make your own custom RNG functionality, I recommend reading the GDScript [doc](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html) on the subject.

#### What if I only want to supply integers for gen_float() or gen_gaussian()?

You can supply integers without incident.

#### What if I only want integer results for gen_gaussian()?

Set your Degrees of Freedom "dof" parameter to 1.


## Documentation

- [RandomNumberGenerator](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html)
- [Randomize()](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randomize)
- [RandI_Range()](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randi-range)
- [RandF_Range()](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randf-range)
- [Snapped()](https://docs.godotengine.org/en/stable/classes/class_@globalscope.html#class-globalscope-method-snapped)
- [RandFn()](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randfn)
- [Rand_Weighted()](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-rand-weighted)


## Acknowledgements

 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [Godot Foundation](https://godot.foundation/)
 - [Shields.io Badges](https://shields.io/)
 - [Opensource.org License Templates](https://opensource.org/license/)


## Authors

Tundra Peaks Studios

[@aaron-tundrapeaksstudios](https://github.com/aaron-tundrapeaksstudios)


## License

[MIT](https://opensource.org/license/mit)

