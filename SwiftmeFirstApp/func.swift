//
//  func.swift
//  SwiftmeFirstApp
//
//  Created by miga on 03.01.2025.
//
import Foundation

func action(_ operands: [String], operation: ([Int]) -> Int?) -> Int? {
    let intOperands = operands.compactMap { Int($0) }
    guard intOperands.count == operands.count else {
        return nil
    }
    return operation(intOperands)
}


func powerOperation(base: Int, exponent: Int) -> Int? {
    guard exponent >= 0 else { // Возведение в степень - только неотрицательные целые
        return nil
    }
    return Int(pow(Double(base), Double(exponent))) // Конвертация int -> double -> pow -> double -> int
}

func getOperands(count: Int) -> [String] {
    var operands: [String] = []
    for i in 1...count {
        print("Введите операнд №\(i)")
        guard let operand = readLine() else {
            print("Некорректный ввод операнда")
            return []
        }
        operands.append(operand)
    }
    return operands
}
