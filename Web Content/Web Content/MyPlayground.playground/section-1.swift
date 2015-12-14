// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var anotherStr = "Ming"

var thirdStr = str + anotherStr

for character in str {
    
    println(character)
    
}

var newStr = "Test String" as NSString

var substring = (str as NSString).substringToIndex(6)

var endingStr = newStr.substringWithRange(NSRange(location: 5, length: 6))

if newStr.containsString("Test") {
    println("A")
}

newStr.componentsSeparatedByString(" ")

newStr.uppercaseString

newStr.lowercaseString