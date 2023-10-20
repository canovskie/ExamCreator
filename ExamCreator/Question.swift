//
//  Question.swift
//  ExamCreator
//
//  Created by Can on 9.10.2023.
//

import Foundation

struct Question {
    
    var number1: Int
    var number2: Int
    let sign: String
    var trueAnswer : Int
    
    init(){
        number1 = Int.random(in: 1...100)
        number2 = Int.random(in: 1...number1)
        sign = ["+", "-", "*", "/"].randomElement() ?? "+"
        trueAnswer = 0
        
        if sign == "*" {
            number1 = Int.random(in: 1...10)
            number2 = Int.random(in: 1...number1)
        }
        
        if sign == "/" {
            while number1 % number2 != 0 {
                number1 = Int.random(in: 1...100)
                number2 = Int.random(in: 1...number1)
            }
        }
        
        if sign == "+" {
            trueAnswer = number1 + number2
        } else if sign == "-" {
            trueAnswer = number1 - number2
        } else if sign == "*" {
            trueAnswer = number1 * number2
        } else if sign == "/" {
            trueAnswer = number1 / number2
        }
    }
    
}
