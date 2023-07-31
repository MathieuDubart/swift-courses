import Cocoa


// -------- if / else
let score = 85
if score > 80 {
    print("Great job")
} else {
    print("try again")
}
score > 80 ? print("Great job") : print("Try again")

let percentage = 65
if percentage < 65 {
    print("sorry you failed the test")
}

let age = 18
if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
} else if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers2 = [1,2,3]
numbers2.append(4)

if numbers2.count > 3 {
    numbers2.remove(at: 0)
}

if !numbers2.isEmpty {
    print("numbers2 isn't empty: \(numbers2)")
}

// -------- switch

enum Weather {
    case sun, rain, wind, snow
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It's sunny")
case .rain:
    print("It's rainy")
case .wind:
    print("It's windy")
case .snow:
    print("It's snowy")
}

// -------- ternary operator

let jackAge = 18
let canVote = jackAge >= 18 ? true : false

let crewNames = ["Jayne", "Kaylee", "Jack"]
let crewCount = crewNames.isEmpty ? "No one in crew" : "\(crewNames.count) people in crew"

enum Theme {
    case dark, light, system
}

let theme = Theme.dark

let background = theme == .dark ? "Black" : "White"

// -------- for loops

let platforms = ["iOS", "watchOS", "tvOS", "macOS", "iPadOS"]
for os in platforms {
    print("Swift works great on \(os)")
}

for i in 0...platforms.count-1 {
    print(i)
    print("Swift works great on \(platforms[i])")
}

for i in 0...12 {
    print("-> The \(i) times tables")
    for j in 0...12 {
        print("   \(j) x \(i) = \(j * i)")
    }
    print()
}

var lyric = "Haters gonna"
for _ in 1..<6 {
    lyric += " hate"
}

print(lyric)

// ------- Break and continue
print("// ------- Break and continue")
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]
for file in filenames {
    if file.hasSuffix(".jpg") == false {
        print("this file: \(file) hasn't .jpg suffix")
        continue
    }
    print("found picture: \(file)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiples.append(i)
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// -------- Checkpoint 3

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("\(i): FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("\(i): Fizz")
    } else if i.isMultiple(of: 5) {
        print("\(i): Buzz")
    } else {
        print(i)
    }
}
