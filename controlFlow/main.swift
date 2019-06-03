//
//  main.swift
//  controlFlow
//
//  Created by samuel muloki on 16/05/2019.
//  Copyright © 2019 line23. All rights reserved.
//

import Foundation

let individualScores = [73, 89, 34, 27, 86]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello"

if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, Optional is nil"
}
print(greeting)

let nickName: String? = nil
let fullName: String = "Duncan Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

// switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add raisins and ants on a log")
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

// while
var n = 2
while n < 100 {
    n *= 2
}

print(n)

// repeat-while
var m = 2
repeat {
    m *= 2
} while m < 100

print(m)

var total = 0
for i in 0..<4 { // 0...4 to include the upper limit
    total += i
}

print(total)
