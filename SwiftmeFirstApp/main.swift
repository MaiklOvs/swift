//
//  main.swift
//  SwiftmeFirstApp
//
//  Created by Mikhail Ovsyannikov on 03.01.2025.
//

import Foundation

print("Введите операцию из доступных: +, -, *, /, ^")
guard let operationSymbol = readLine() else {
    print("Некорректный ввод операции")
    exit(1)
}


switch operationSymbol {
case "+", "-", "*", "/":
    print("Введите количество операндов")
    guard let operandsCountStr = readLine(), let operandsCount = Int(operandsCountStr), operandsCount > 0 else {
        print("Некорректный ввод количества операндов")
        exit(1)
    }
    
    let operands = getOperands(count: operandsCount)
    
    if operands.count != operandsCount {
        exit(1)
    }
    
    switch operationSymbol {
    case "+":
        let result = action(operands) { $0.reduce(0, +) }
        if let result = result {
            print("Результат сложения - \(result)")
        } else {
            print("Ошибка при выполнении операции сложения")
        }
    case "*":
        let result = action(operands) { $0.reduce(1, *) }
        if let result = result {
            print("Результат умножения - \(result)")
        } else {
            print("Ошибка при выполнении операции умножения")
        }
    case "-":
        let result = action(operands) {
            guard let first = $0.first else { return nil }
            return $0.dropFirst().reduce(first, -)
        }
        if let result = result {
            print("Результат вычитания - \(result)")
        } else {
            print("Ошибка при выполнении операции вычитания")
        }
    case "/":
        let result = action(operands) {
            guard let first = $0.first else { return nil }
               return $0.dropFirst().reduce(into: first) { (result, next) in
                    guard next != 0 else {
                        return
                    }
                    result /= next
                }
          }
        if let result = result {
           print("Результат деления - \(result)")
        } else {
            print("Ошибка при выполнении операции деления")
        }
    default:
        break
    }
case "^":
    let operands = getOperands(count: 2)
    if operands.count != 2 {
        exit(1)
    }
    
    let result = action(operands) { powerOperation(base: $0[0], exponent: $0[1]) }
    if let result = result {
        print("Результат возведения в степень - \(result)")
    } else {
        print("Ошибка при выполнении операции возведения в степень")
    }
    
default:
    print("Неизвестная операция")
}
