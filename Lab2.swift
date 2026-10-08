import Foundation

//1.Enum
enum JobPosition: String {
    case developer = "Developer"
    case designer = "Designer"
    case manager = "Manager"
}

//2.Структура
struct Address {
    var street: String
    var city: String
    var zipCode: Int?
}

//3.Базовий клас
class Person {
    var firstName: String
    var lastName: String?
    var age: Int?
    
    var ageStatus: String {
        guard let actualAge = age else {
            return "Вік не вказано (статус невідомий)"
        }
        
        if actualAge < 0 {
            return "Некоректний вік"
        } else if actualAge < 12 {
            return "Дитина (\(actualAge) р.)"
        } else if actualAge < 18 {
            return "Підліток (\(actualAge) р.)"
        } else if actualAge < 35 {
            return "Повнолітня особа (\(actualAge) р.)"
        } else if actualAge < 60 {
            return "Доросла особа (\(actualAge) р.)"
        } else {
            return "Людина похилого віку (\(actualAge) р.)"
        }
//        if let actualAge = age {
//            if actualAge < 0 {
//                return "Некоректний вік"
//            } else if actualAge < 12 {
//                return "Дитина (\(actualAge) р.)"
//            } else if actualAge < 18 {
//                return "Підліток (\(actualAge) р.)"
//            } else if actualAge < 35 {
//                return "Повнолітня особа (\(actualAge) р.)"
//            } else if actualAge < 60 {
//                return "Доросла особа (\(actualAge) р.)"
//            } else {
//                return "Людина похилого віку (\(actualAge) р.)"
//            }
//        } else {
//            return "Вік не вказано (статус невідомий)"
//        }
    }

    
    init(firstName: String, lastName: String? = nil, age: Int? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func displayInfo() {
        let lastNameText = lastName ?? "(прізвище відсутнє)"
        
        var ageText = "вік невідомий"
        if let actualAge = age {
            ageText = "\(actualAge) років"
        }
        
        print("Людина: \(firstName) \(lastNameText), \(ageText)")
    }
    
    
    func greet() {
        var greeting = "Привіт, \(firstName)!"
        
        if let last = lastName {
            greeting += " \(last)"
        }
        
        if let currentAge = age {
            greeting += " Вам \(currentAge) р."
        } else {
            greeting += " (Вік не вказано)"
        }
        
        print(greeting)
    }
}


//4.Наслідування класів
class Employee: Person {
    var position: JobPosition
    var address: Address
    
    init(firstName: String, lastName: String? = nil, age: Int? = nil, position: JobPosition, address: Address) {
        self.position = position
        self.address = address
        
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    
    override func displayInfo() {
        super.displayInfo()
        
        let zip = address.zipCode != nil ? "\(address.zipCode!)"  : "без індексу"
        print("Посада: \(position.rawValue) | Адреса: м. \(address.city), вул. \(address.street) (\(zip)\n")
    }
}


//5.Окремі функції
func greetPerson(person: Person) {
    let fullName: String
    if let lastName = person.lastName {
        fullName = "\(person.firstName) \(lastName)"
    } else {
        fullName = person.firstName
    }
    
    let ageInfo = person.age != nil ? "віком \(person.age!) р." : "вік не вказано"
    print("[Вітання від функції]: Вітаємо, \(fullName)! (\(ageInfo))")
}

func processPeopleList(people: [Person]) {
    print("=== ОБРОБКА СПИСКУ (МАСИВІВ) ===")
    for person in people {
        person.displayInfo()
    }
}

//6.Тестування
print("ТЕСТУВАННЯ \n")

let person1 = Person(firstName: "Олена")
let person2 = Person(firstName: "Ігор", lastName: "Петренко", age: 22)

greetPerson(person: person1)
person2.greet()
print()

var address1 = Address(street: "Шевченка 10", city: "Львів", zipCode: 79000)
var addressCopy = address1
addressCopy.street = "Франка 5"

print("Оригінальна вулиця: \(address1.street)")
print("Оригінальна вулиця: \(addressCopy.street)\n")

let emp1 = Employee(
    firstName: "Віталій",
    lastName: "Биць",
    age: 19,
    position: .developer,
    address: address1
)

let emp2 = Employee(
    firstName: "Максим",
    position: .designer,
    address: Address(street: "Городоцька 15", city: "Львів", zipCode: nil)
)
    
    let team: [Person] = [person1, person2, emp1, emp2]
    processPeopleList(people: team)


let test1 = Person(firstName: "Анна")
print("\(test1.firstName): \(test1.ageStatus)")


let test2 = Person(firstName: "Богдан", age: 8)
print("\(test2.firstName): \(test2.ageStatus)")


let test3 = Person(firstName: "Софія", age: 15)
print("\(test3.firstName): \(test3.ageStatus)")


let test4 = Person(firstName: "Андрій", age: 25)
print("\(test4.firstName): \(test4.ageStatus)")


let test5 = Person(firstName: "Оксана", age: 45)
print("\(test5.firstName): \(test5.ageStatus)")


let test6 = Person(firstName: "Василь", age: 67)
print("\(test6.firstName): \(test6.ageStatus)")

