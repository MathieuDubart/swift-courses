import Cocoa

// ----- classes and inheritance

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


class Employee {
    let hours:Int
    
    init(hours:Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I Work \(hours) hours a day.")
    }
}

final class Developer: Employee { // -- final permet de dire qu'aucune classe ne pourra hériter de Developer
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() { // -- override fonctionne aussi avec init
        print("I'm a developper and I work \(hours) hours a day.")
    }
}

let dev = Developer(hours:8)
dev.work()
dev.printSummary()

// ----- initializers

class Vehicle {
    let isElectric:Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// -- Pour héritage des classes, super.init() obligatoire pour l'init si rajout de prop
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// ----- Copying classes
// -- Copies of a class instance point to the same instance.
// -- Si on change une copie ça les change toutes, y compris l'instance originale

class User {
    var username = "Anonymous"
    
    // -- si super.init dans init alors pas besoin de override
    func copy() -> User {
        let user = User()
        user.username = self.username
        return user
    }
}
var user1 = User()
var user2 = user1
user2.username = "Taylor Swift"
print("\(user1.username) // \(user2.username)")

var user3 = user1.copy()
user3.username = "Anonymous"

print("\(user2.username) // \(user3.username)")

// ----- Deinitializers
// -- jamais de paramètres (donc pas de parenthèses) + ne retourne jamais de data
// -- deinit utilisé quand la dernière instance d'une classe est détruite
// -- deinit ne sont pas appelés par nous mais par système
// -- structures n'ont pas de deinit

class UserForDeinit {
    let id: Int
    
    init(id:Int) {
        self.id = id
        print("User \(id): I'm alive")
    }
    
    deinit {
        print("User \(id): I'm dead")
    }
}

var users = [UserForDeinit]()

for i in 1...3 {
    let user = UserForDeinit(id:i)
    users.append(user)
}

users = []

// -- chaque fois qu'on écrase l'instance on passe dans deinit

// ----- Variables in classes

class UserC {
    var name = "Paul"
}

let user = UserC()
user.name = "Taylor"
print(user.name) // -- On peut changer les datas dans l'instance de la classe même si l'instance est une constante

// ----- Checkpoint 7

class Animal {
    let legs: Int
    
    init(numberOfLegs: Int) {
        self.legs = numberOfLegs
    }
}

class Dog: Animal {
    func speak() {
        print("woof woof")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(numberOfLegs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(numberOfLegs: numberOfLegs)
    }
    
    func speak() {
        print("meow")
    }
}

class Corgi: Dog {
    override func speak() {
        print("woof from corgi")
    }
}

class Poodle: Dog {
    override func speak() {
        print("woof from poodle")
    }
}

class Persian: Cat {
    override func speak() {
        print("meow from persian")
    }
}

class Lion: Cat {
    override func speak() {
        print("roar from lion")
    }
}
