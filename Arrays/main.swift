//
//  main.swift
//  Arrays
//
//  Created by samuel muloki on 16/05/2019.
//  Copyright © 2019 line23. All rights reserved.
//

import Foundation

var shoppingList = ["catfish", "water", "Tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Samuel": "Software Engineer",
    "Duncan": "Pilot"
]
occupations["Samuel"] = "CEO"
shoppingList.append("blue paint")
print(shoppingList)
print(occupations)
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
print(emptyArray)
print(emptyDictionary)
