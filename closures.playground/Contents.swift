import Cocoa

// -------- closures

func greetUser() {
    print("Hey there!")
}

greetUser()
//var greetCopy = greetUser
//typage, () -> Void = ne prend aucun param et return rien
var greetCopy: () -> Void = greetUser
greetCopy()


let sayHello = { (name:String) -> String in //avant le 'in': paramètres, après: code
    "Hey \(name)"
}
sayHello("Yann")

func getUserData(for id:Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    }
    
    return "Anonymous"
}

let data: (Int) -> String = getUserData
let userData = data(1989)
print(userData)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1:String, name2:String) -> Bool{
    if name1 == "Suzanne" { return true }
    else if name2 == "Suzanne" { return false }
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (name1:String, name2:String) -> Bool in
    if name1 == "Suzanne" { return true }
    else if name2 == "Suzanne" { return false }
    return name1 < name2
})

print("1: \(captainFirstTeam)")

// En gros les closures c'est des callbacks


// ------- Trailling closure

// quand une fonction prend en paramètre une autre fonction, on peut l'écrire comme ça:
let captainFirstTeam2 = team.sorted{ a, b in
    if a == "Suzanne" { return true }
    else if b == "Suzanne" { return false }
    return a < b
}
print("2: \(captainFirstTeam2)")

// et aussi comme ça (ça fait beaucoup):
let captainFirstTeam3 = team.sorted{
    if $0 == "Suzanne" { return true }
    else if $1 == "Suzanne" { return false }
    return $0 < $1
}
print("3: \(captainFirstTeam3)")

//autre exemple avec les $ (on utilise les $ généralement quand on utilise qu'une fois le param + 2 params max ($0 et $1))
let reverseTeam = team.sorted { $0 > $1 }
print("reversed team: \(reverseTeam)")

// ------ filter et map

let tOnly = team.filter{$0.hasPrefix("T")}
print(tOnly)

let uppercasedTeam = team.map { $0.uppercased() }
print(uppercasedTeam)


// la fonction makeArray prend en paramètres une taille (entier) et un generateur (fonction qui retourne un entier).
// makeArray retourne un tableau d'entiers.
// using = nom exterieur de la variable generator (comme avec le for numbers:Int avant)
func makeArray(size:Int, using generator: () -> Int) -> [Int]{
    var numbers = [Int]()
    
    for _ in 0..<size{
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {print("This is the first work")}
second: {print("This is the second work")}
third: {print("This is the third work")}

// ------ Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers.filter{ $0.isMultiple(of: 2) ? false : true }
            .sorted { $0 < $1 }
            .map { print("\($0) is a lucky number") }

// -----------------------------------
