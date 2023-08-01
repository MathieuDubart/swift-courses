import Cocoa

// ----- Optionals

// -- les optionals peuvent avoir une valeur ou non

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

// -- nomenclature d'un optional
let optional: String? = nil // -- nil = pas de valeur

// -- contient soit une valeur (ex: "Hello World") soit 'nil'
// -- pour utiliser un optionnel (vide ou non), on doit le déballer:

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
// possibilité d'ajouter un else si l'optional = nil :
else {
    print("No opposite")
}

func square(number: Int) {
    number * number
}

var number: Int? = nil

// -- quand on déballe un optional, le standard cest de noter la constante avec
// -- le même nom que l'optional qu'on déballe (au début ça porte à confusion)
// -- (cest parce que le scope tout ça)

if let number = number {
    // l'optional déballé est valable que dans ce scope bien entendu
    square(number: number)
}

// ----- déballer un optional avec guard let

func printSquare(of number: Int?) {
    guard let number = number else {
        print("missing input")
        return
    }
    print("\(number) x \(number) = \(number * number)")
}
var toSquare: Int? = nil
printSquare(of: toSquare)

// -- déballer avec if let : le code dans les {} s'exécute si il y a une valeur dans l'optionnel
// -- déballer avec guard let: le code dans les {} s'éxecute si il n'y a AUCUNE valeur dans l'optional
// -- Si on utilise guard let:
// -- On est obligé de mettre un return dans les {} si le guard check ne fonctionne pas (optional vide)
// -- En gros 'guard let unwrapped = optional { return }' se traduit par:
// -- si l'optional a une valeur alors on la stocke dans la constante unwrapped
// -- sinon on sort de la fonction guard (return)
// -- à la différence de if let, la valeur acquise avec guard let est utilisable en dehors des {}
// -- BONUS // guard est aussi utilisable sur toute sorte de condition, ex:

func printArray(_ array:[Int]) {
    guard !array.isEmpty else {
        print("array is empty")
        return
    }
    
    print(array)
}

let array = [1, 5, 2, 16]
let emptyArray = [Int]()

printArray(array)
printArray(emptyArray)

// ----- déballer un optional avec le nil coalescing ('??')

let captains = ["Enterprise": "Picard",
                "Voyager": "Janeway",
                "Defiant":"Sisko"]

// -- let new = captains["Serenity"] // --> return nil
// -- déballage avec le nil coalescing ('??'):

let new = captains["Serenity"] ?? "N/A"

// -- nil coalescing ('??') permet de déballer l'optional dans une constante (ici 'new') si il contient une valeur.
// -- Sinon il va fournir une valeur par défaut (ici 'N/A').
// -- Autres exemples:

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title:String
    let author:String?
}

let book = Book(title: "Harry Potter", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 0
print(number2)

// ----- Handle multiple optionals with optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// -- le '?' entre randomElement() et uppercased() permet de chaîner les optionals
// -- Trad: Si l'optional a une valeur alors déballe le et exécute le code suivant (ici 'uppercased()') sur la valeur
// -- sinon fournit la valeur "No one" et la suite du code (ici 'uppercased()') est ignorée

struct BookTwo {
    let title: String
    let author: String?
}

var bookTwo: BookTwo? = BookTwo(title:"ABCD", author:"robert")
let authorTwo = bookTwo?.author?.first?.uppercased() ?? "A"
print(authorTwo)

// -- Description:
// -- 'bookTwo?' --> SI on a un livre
// -- '.author?' --> ET que ce livre a un auteur
// -- '.first?' --> ET que l'auteur a une première lettre à son nom
// -- '.uppercased()' --> alors on la met en majuscule et on la retourne
// -- ?? "A" --> sinon si une des conditions échoue (donc si un des optionnel est vide) on retourne "A"

// ----- Handle function failure with optionals

// -- traiter les erreurs de fonctions avec un optional
// -- est une alternative au throw try (chapitre sur les fonctions)
// -- pour ça on utilise try?
// -- La fonction s'execute en amont et si elle fonctionne elle retourne le résultat sous forme d'optional
// -- sinon si il y a une erreur elle retourne nil.
// -- Point faible: si il y une erreur, on ne saura pas laquelle c'est

enum UserError:Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// -- fonctionne aussi avec le nil coalescing (mais il faut mettre toute la partie de gauche entre parenthèses)
let user = (try? getUser(id: 23)) ?? "No user"
print(user)

// ----- Checkpoint 9

func returnInteger(from intArray:[Int]?) -> Int {
    let random = intArray?.randomElement() ?? Int.random(in: 0...100)
    return random
}

let randomArray = [0, 68, 12, 4, 31]
let emptyRandomArray = [Int]()

//let randomNumber = returnInteger(from: randomArray) // --> retourne un nombre aléatoire du tableau
let randomNumber = returnInteger(from: emptyRandomArray) // --> retourne un nombre aléatoire entre 1 et 100
print(randomNumber)

// -------------------------------------------------------------------
