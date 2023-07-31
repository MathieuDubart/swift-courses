import Cocoa

// ------ Structures

struct Album {
    let title:String
    let artist:String
    let year:Int
    
    func printSummary() {
        print("\(title) - \(year) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

red.printSummary()
wings.printSummary()

// ------ mutating functions in structures & computed variables ( get set )

struct Employee1 {
    let name: String
    var vacationAllocated = 10
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get { // comment on obtient vacationRemaining
            vacationAllocated - vacationTaken
        }
        set {
            // recalcul vacationAllocated
            vacationAllocated = vacationTaken + newValue // newValue = vacationRemaining
            // nombre de vacances alloués = nombre de jours pris + nombre de jours restants
        }
    }
    
    /*
     mutating func takeVacations(days:Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Not enough days for vacations")
        }
    }
     */
}

var employee1 = Employee1(name: "Anna", vacationAllocated: 14)
//employee1.takeVacations(days: 11)
employee1.vacationTaken += 4
employee1.vacationRemaining = 5
print("\(employee1.vacationAllocated) days")

//keyword mutating devant func quand le fonction manipule de la donnée.

// ------ didSet et willSet

struct Game {
    var score = 0 {
        didSet {
            print("Score was \(oldValue) and it's now \(score)") // print à chaque fois que score change (s'exécute après le willSet)
        }
        willSet {
            print("Score will be \(newValue)") // print à chaque fois que le code va changer (s'exécute avant le didSet)
        }
    }
}

var game = Game()

game.score += 10

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be \(newValue)")
        }
    }
}

var app = App()
app.contacts.append("Jeremy")

// Rappel: ne pas mettre trop d'opérations dans le willSet

// ----- custom initializers

struct Player {
    let name: String
    let number: Int
    
    init(name:String) {
        self.name = name
        self.number = Int.random(in: 0...99)
    }
}

var playerOne = Player(name: "George")
print("\(playerOne.name)'s number is \(playerOne.number)")

// ----- access control of data

// different access control levels
// private / private(set)
// fileprivate
// public

struct BankAccount {
    private(set) var funds = 0 {
        didSet {
            print("Money: $\(funds)")
        }
    }
    
    mutating func deposit(amount:Int) {
        self.funds += amount
    }
    
    mutating func withdraw(amount:Int) -> Bool {
        if self.funds > amount {
            funds -= amount
            return true
        }
        return false
    }
}

var bankAccount = BankAccount()
bankAccount.deposit(amount: 15)
bankAccount.deposit(amount: 50)
bankAccount.withdraw(amount: 60)

// ----- static properties and methods

// ici la prop studentCount et la methode add() agissent sur
// la struct School et non sur une instance
// + pas besoin de 'mutating' pour methods qui modifient les props

// self = current value of a struct
// Self = current type of struct

struct School {
    static var studentCount = 0
    
    static func add(student:String) {
        print("\(student) joined the scool.")
        studentCount += 1
    }
}

School.add(student:"Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 version 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.google.com"
}

AppData.version

struct Employee2 {
    let username: String
    let password: String
    
    static let example = Employee2(username: "cfederighi", password: "h4irf0rce0ne")
    // static permet de dire que example ne contient pas d'autre instance de Employee2
}

Employee2.example.username // appelable partout

// ----- Checkpoint 6

struct Car {
    let model:String
    let NofSeats: Int = 5
    private(set) var currentGear = 0 {
        willSet {
            print("New gear is \(newValue)")
        }
    }
    
    mutating func changeGear(to newGear:Int) -> Bool {
        if newGear > self.currentGear && newGear <= 10 {
            self.currentGear = newGear
            print("Gear upgraded")
            return true
        } else if newGear < self.currentGear && newGear >= 0 {
            if newGear == 0 {
                self.currentGear = newGear
                print("Gear downgraded, now it is at neutral point")
                return true
            }
            self.currentGear = newGear
            print("Gear Downgraded")
            return true
        }
        print("Gear can't be upgraded or downgraded")
        return false
    }
}

var car = Car(model: "Toyota Corola")
car.changeGear(to: 1)
car.changeGear(to: 0)


// -------------------------------------
