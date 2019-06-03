//
//  main.swift
//  Intro
//
//  Created by samuel muloki on 16/05/2019.
//  Copyright © 2019 line23. All rights reserved.
//

import Foundation

print("Hello, World!")

var myVariable = 43
myVariable = 50
print(myVariable)
let myConstant = 23
print(myConstant)

let label = "The width is "
let width = 54
let widthLabel = label + String(width)
print(widthLabel)
let apples = 3
let oranges = 7
let appleSummary = "I have \(apples) apples."
print(appleSummary)
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
print(fruitSummary)

let explicitDouble: Double = 70
let implicitDouble = 23.0
print("Adding doubles \(explicitDouble + implicitDouble)")

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit"
"""
print(quotation)
