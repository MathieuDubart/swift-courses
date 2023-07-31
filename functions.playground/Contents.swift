import Cocoa

// -------- functions

func getUser() -> (firstName:String, lastName:String, age:Int) {
    (firstName:"Taylor", lastName:"Swift", age: 26)
    // peut aussi s'écrire
    //("Taylor", "Swift", 26)
}

let user = getUser()
print("User \(user.firstName) \(user.lastName) is \(user.2) years old")

let (firstName, lastName, userAge) = getUser()
print("User \(firstName) \(lastName) is \(userAge) years old")

let (firstName2, lastName2, _) = getUser()
print("User: \(firstName) \(lastName)")

// ---

func hireEmployee(name:String) {}
func hireEmployee(title:String) {}
func hireEmployee(location:String) {} // ----> 3 fonctions différentes

// ---

//func isUppercase(string:String) -> Bool {
func isUppercase(_ string:String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO WORLD"
//let result = isUppercase(string: string)
let result = isUppercase(string) // le _ dans les paramètres permet d'enlever le nom du paramètre


func printTimesTable(for number:Int = 3) { // ici le 'for number:Int' permet de nommer le paramètre 'for' mais de l'utiliser dans la fonction sous le nom de 'number'
    for i in 1...12 {
        print("\(i) x \(number) = \(i*number)")
    }
}

printTimesTable(for: 5)
print(String(repeating: "-", count: 5))
printTimesTable()

// -------- Handling errors in functions

enum PasswordError:Error {
    case short, obvious
}

// le mot clé 'throws' indique que la fonction peut retourner une erreur (on ne sait jamais lesquelles)
func checkPassword(_ password: String) throws -> String {
    // si mdp trop court, on retourne l'erreur Password.short
    if password.count < 5 { throw PasswordError.short }
    // si mdp trop évident, on retourne l'erreur Password.obvious
    if password == "12345" || password == "password" { throw PasswordError.obvious }
    
    // si pas d'erreur on effectue d'autres tests sans erreurs
    if password.count < 8{
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let password = "12345"

do {
    let result = try checkPassword(password)
    print("Password rating: \(result)")
} catch {
    print("There was an error")
} // -> do {} catch {} permet de dérouler la fonction (do) ou traiter les erreurs si il y en a (catch)

// Traiter les erreurs particulières:

do {
    let result = try checkPassword(password)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Error. Password is too short.")
} catch PasswordError.obvious {
    print("Error. Password is too obvious.")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

// -------- Checkpoint 4

enum SqrtError:Error {
    case outOfBounds, noRoot
}

func squareRoot(of number:Int) throws -> Int {
    if number > 10_000 || number < 1 { throw SqrtError.outOfBounds }
    for i in 1...100 {
        if i*i == number { return i }
    }
    throw SqrtError.noRoot
}

do {
    let result = try squareRoot(of: 10_001)
    print("Square root is \(result)")
} catch SqrtError.outOfBounds {
    print("Error. Number is out of bounds.")
} catch SqrtError.noRoot {
    print("Error. Number don't have an Int square root")
} catch {
    print("Error: \(error.localizedDescription)")
}

// ---------------------------------------------
