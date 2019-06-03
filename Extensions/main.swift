//
//  main.swift
//  Extensions
//
//  Created by samuel muloki on 30/05/2019.
//  Copyright © 2019 line23. All rights reserved.
//

import Foundation

/* Extensions add new functionality to an existing class, structure, enumeration, or protocol
type
 Extensions in Swift can:
 
 -> Add computed instance properties and computed type properties
 -> Define instance methods and type methods
 -> Provide new initializers
 -> Define subscripts
 -> Define and use new nested types
 -> Make an existing type conform to a protocol
 
 Note: Extensions can add new functionality to a type, but they cannot override existing
 functionality
 
 extension SomeType {
 // new functionality to add to SomeType goes here
 }
 
 Note: If you define an extension to add new functionality to an existing type, the new
functionality will be available on all existing instances of that type, even if they were
created before the extension was defined
 */

extension Double{
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print(centerRect.origin)

extension Int {
    func repeatitions(task: () -> Void) -> Void {
        for _ in 0..<self {
            task()
        }
    }
}

3.repeatitions {
    print("Hello!")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt)

// Subscripts

// 123456789[0] returns 9
// 123456789[1] returns 8

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(746381295[0])
print(746381295[1])
print(746381295[2])
print(746381295[8])
print(746381295[9])

// Nested Types

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
    
}

func printIntegerKinds(_ numbers: [Int]) {
    for  number in numbers {
        switch number.kind{
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
