//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Yuriy Nefedov on 20.07.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    private var number: Double?
    private var intermediateCalculation: (firstNumber: Double, operand: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    internal mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "=" {
                return performTwoNumberCalculation(n2: n)
            } else {
                intermediateCalculation = (firstNumber: n, operand: symbol)
            }
        }
        return nil
    }
    
    func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.firstNumber, let operation = intermediateCalculation?.operand {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                return nil
            }
        }
        return nil
    }
}
