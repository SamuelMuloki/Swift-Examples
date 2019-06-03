//
//  main.swift
//  Closures
//
//  Created by samuel muloki on 21/05/2019.
//  Copyright © 2019 line23. All rights reserved.
//

import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let dishes = ["Rice", "Posho", "Beans", "Potatoes", "Greens"]
let cities = ["Kampala", "Nairobi", "New York", "San Fransisco", "Lagos"]
print(names.sorted())
// The in keyword indicates that the definition of the closure’s parameters and return type
// has finished, and the body of the closure is about to begin.
let reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames)
print(dishes.sorted(by: { s1, s2 in s1 > s2}))
print(cities.sorted(by: { $0 > $1 }))
print(names.sorted(by: >))

// Trailing Closures
print(cities.sorted() {$0 > $1})
// No parenthesis
print(dishes.sorted {$0 > $1})

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{(number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

print(strings)

// escaping closures
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class someClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = someClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// Auto Closures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0)) //Could be { customersInLine.remove(at: 0) }
print(customersInLine.count)

// Swift lazy properties with a closure

class Name {
    var name: String?
    lazy var greet: String = {[weak self] in
        guard let s = self else { return "Unable to unwrap self" }
        guard let n = s.name else { return "No name found" }
        
        return "Hi, \(n)"
    }()
    
    init(name: String) {
        self.name = name
    }
}

var n = Name(name: "Anupam")
print(n.greet)
