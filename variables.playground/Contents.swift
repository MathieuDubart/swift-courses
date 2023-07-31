import Cocoa

var greeting = "Hello, playground"
let quote = """
Then he taped a sign saying
\"Believe\" and walked away.
"""

print(quote)

var counter = 10
counter += 5
counter *= 2
counter -= 2
counter /= 4

print(counter)

let number = 120
print(number.isMultiple(of: 3))
print("cc")

let a = 1
let b = 2.0

let c = a + Int(b)
let d = Double(a) + b

var isMultiple = 120.isMultiple(of: 3)
isMultiple = !isMultiple
isMultiple.toggle()

// ------ Checkpoint 1

let temperatureInCelsius:Double = 10.5
var temperatureInFarenheit = (temperatureInCelsius*9)/5 + 32
print("The Celsius temp is \(temperatureInCelsius)°C and the Farenheit temp is \(temperatureInFarenheit)°F")

var beatles = ["John", "Paul", "George", "Ringo"]
beatles.append("New Singer")


// ------------------------------------------ //
