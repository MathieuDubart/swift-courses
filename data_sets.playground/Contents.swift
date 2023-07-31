import Cocoa

// ------ Arrays

var scores = Array<Int>()
scores.append(100)
scores.append(42)
scores.append(67)

print(scores.count)

var albums:Array<String> = []
albums.append("La fête est finie")

var singers = [String]()
singers.append("Eminem")

var characters = ["Lana", "Pam", "Ray", "Sterling"]
characters.remove(at: 2)
print(characters)
characters.removeAll()
print(characters)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities:[String] = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

var numbers:[Int] = [1, 2, 3, 4]
numbers = numbers.reversed()
print(numbers)

// ------ Dictionnary

let employee:[String:String] = [
    "name":"Taylor Swift",
    "job":"singer",
    "location":"Nashville"
]

print(employee["name", default: "Unknown"])
print(employee["age", default: "Unknown"])

let hasGraduated:[String:Bool] = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics:[Int:String] = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights:[String:Int] = [String:Int]()
heights["Yao Ming"] = 229
heights["LeBron James"] = 206
heights["Shaquille O'Neal"] = 216

print(heights["LeBron James", default: 0])

var archEnemies = [String:String]()

archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

// -------- Sets

var actors: Set<String> = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson",
    "Tom Cruise"
]) // ------ Data position stored randomly + doesn't allow duplicates
actors.insert("Michael Keaton")
actors.contains("Tom Cruise")

var sortedActors = actors.sorted()
print(actors)
print(sortedActors)

// -------- Enums

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day:Weekday = Weekday.monday
day = .thursday
day = .friday

// -------- Constants

let username:String
username = "@mathieudbrt"
print(username)


// ------ Checkpoint 2

let arrayOfStrings = ["Some", "Strings", "In", "Strings", "Array"]
print(arrayOfStrings.count)

let setOfStrings = Set(["Some", "Strings", "In", "Strings", "Array"])
print(setOfStrings.count)

// ------------------------------------------ //
