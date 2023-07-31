import Cocoa

// ----- Protocols

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

class Car: Vehicle {
    let name = "Car" // -- pour def constante depuis protocol: var dans protocol et let dans class
    var currentPassengers: Int
    
    init(currentPassengers: Int) {
        self.currentPassengers = currentPassengers
    }
    
    
    func estimateTime(for distance: Int) -> Int {
        return distance/50
    }
    
    func travel(distance: Int) {
        print("\(self.name): \(distance)km takes \(self.estimateTime(for: distance))min")
    }
    
    func openSunRoof() {
        print("sun roof opened, nice sun")
    }
}

class Bike: Vehicle {
    let name = "Bike" // -- pour def constante depuis protocol: var dans protocol et let dans class
    var currentPassengers: Int
    
    init(currentPassengers: Int) {
        self.currentPassengers = currentPassengers
    }
    
    
    func estimateTime(for distance: Int) -> Int {
        return distance/10
    }
    
    func travel(distance: Int) {
        print("\(self.name): \(distance)km takes \(self.estimateTime(for: distance))min")
    }
    
    func openSunRoof() {
        print("sun roof opened, nice sun")
    }
}

func commute (distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow, I'll try a different vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}

commute(distance: 100, using: Car(currentPassengers: 4))

func getTravelEstimates(using vehicles: [Vehicle], distance:Int) {
    for vehicle in vehicles {
        commute(distance: distance, using: vehicle)
    }
}

getTravelEstimates(using: [Car(currentPassengers: 2), Bike(currentPassengers: 2)], distance: 10)
// -- Si la classe Car se conforme (hérite) au protocol Vehicle mais
// -- n'implémente pas AU MINIMUM les méthodes estimateTime()
// -- et travel() et les variables name et currentPassenger, alors la classe Car
// -- n'est pas conforme au protocol Vehicle et Swift ne build pas.

// -- Une classe conforme à un protocol peut-être utilisée partout où ce même protocol est nécessaire
// -- vu qu'elle dispose OBLIGATOIREMENT des mêmes variables et méthodes que celui-ci.


// ----- opaque return  type


func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

// -- En gros le some Equatable permet d'apporter flexibilité, par exemple dans getRandomNumber()
// -- si je remplace Int.random() par Double.random(), j'ai pas besoin de changer le type du return
// -- + Swift connaît quand même le type de la valeur retournée (Double, Int etc...)

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

let num = getRandomNumber()
print(num)

// -- en gros le 'some Equatable' permet de ne pas avoir à spécifier le type retourné
// -- mais Swift sait quand même précisément quel type il retourne
// -- Pour les view en Swift UI ça serait 'some View'
// -- Si le protocol Vehicle retournait un type de vehicule, ça serait 'some Vehicle'


// ----- Extensions

var quote = "      The truth is rarely pure and never simple      "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(quote)
print(trimmed)

// -- super long à écrire à chaque fois
// -- donc on crée une extension qui permet d'ajouter une méthode
// -- NB: - suivant ce qu'on cherche à faire, les extensions sont mieux que les fonctions globales

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    // -- fonctionne aussi avec les propriétés calculées
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
quote.trim()
print(quote)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    // -- si on met un init dans la structure alors swift va oublier l'init par défaut pour utiliser le notre
    // -- donc pour parer à ça, on met notre init dans une extension si on veut calculer ReadingHours
    // -- et quand même pouvoir le passer en paramètres.
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount/50
    }
}

let lotr = Book(title: "Lord of the Ring", pageCount: 1178, readingHours: 24)
let hPotter = Book(title: "Harry Potter", pageCount: 578)

// -- mettre un init spécial dans une extension pour une structure permet
// -- de pouvoir utiliser la structure avec les deux initializers suivant le besoin

// ----- Protocol extensions

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
        // si isEmpty est false alors isNotEmpty est true
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

// -- au lieu de faire 'if !guests.isEmpty' ou 'if guests.isEmpty == false'
// -- on créé une extension de la structure Collection qui permet de calculer une nouvelle propriété 'isNotEmpty'
// -- pour rendre le code plus lisible et compréhensible.
// -- (+ isNotEmpty est utilisable sur toutes les structures conforment au protocol Collection
// -- à savoir les Array, Set et Dictionnaires.)

protocol Person {
    var name: String {get}
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee:Person {
    let name: String
}

// -- l'extension de Person permet de ne pas avoir à définir la methode sayHello()
// -- dans chaque structure/classe conforme au protocol parce qu'elles l'auront déjà

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// ----- Protocol extension - go further

extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

// -- rajoute une methode sur les types Int & Double qui permet de calculer le carré en multipliant le nombre par lui-même
// -- pour ça le type de return devient 'Self' parce qu'on ne sait pas si ça sera un Int ou un Double
// -- rappel:
// -- self avec s minuscule = current value (ex: 5)
// -- Self avec S majuscule = current type (ex: Int)
// -- donc si le nombre est 5:
// -- self = 5 & Self = Int
// -- si le nombre est 4.2:
// -- self = 4.2 & Self = Double

// -- User est confome à DEUX protocoles: Equatable et Comparable
struct User: Comparable {
    let name: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}

let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2) //false
print(user1 != user2) //true

print(user1 < user2) // -- on trie des noms, Link vient avant Zelda donc trues
print(user1 <= user2) // -- fonctionne aussi avec 'less than or equal'
print(user1 > user2) // -- et fonctionne avec tous les autres
print(user1 >= user2) // -- Equatable permet de dire si 'égal' et Comparable si 'plus petit' donc combo permet de dire 'plus petit ou égal' ou l'inverse

// -- en 're-définissant une comparaison' dans User, ça 're-définie toutes les autres automatiquement'
// -- On peut aussi retirer Equatable dans la conformité de la structure et ça fontionne quand même:
// -- struct User: Equatable, Comparable {}
// -- devient
// -- struct User: Comparable {}

// -- avoir une struct conforme à Equatable fait que Swift va comparer toutes les propriétés
// -- des instances structures à comparer (ici la prop 'name')
// -- par exemple si user2 avait comme nom "Link" la comparaison user1 == user2 serait vraie.


// ----- Checkpoint 8

protocol Building {
    var rooms: Int {get set}
    var cost: Int {get set}
    var estateName: String {get set}
    
    func summary()
}

extension Building {
    func summary() {
        print("The building has \(rooms) rooms, it cost $\(cost) and it was built by \(estateName).")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var estateName: String
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var estateName: String
}

var buildings = [Building]()

let house = House(rooms: 6, cost: 700_000, estateName: "Estate Name")
buildings.append(house)
let office = Office(rooms: 22, cost: 1_500_000, estateName: "Other Estate Name")
buildings.append(office)

for building in buildings {
    building.summary()
}
