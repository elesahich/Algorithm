//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/10.
//  Copyright © 2020 elesahich. All rights reserved.
//  42628

import Foundation

private func solution(_ operations: [String]) -> [Int] {
    var tempArray: [Int] = []
    operations.forEach() {
        let firstValue = $0.first ?? nil
        let lastValue = $0.split(separator: " ").last
        
        if firstValue == "I" {
            let element = lastValue.map { last -> Int in return Int(last)! }!
            tempArray.append(element)
            tempArray.sort()
        } else {
            if lastValue == "1" && !tempArray.isEmpty {
                tempArray.removeLast()
            } else if lastValue == "-1" && !tempArray.isEmpty {
                tempArray.removeFirst()
            }
        }
    }
    var resultArray: [Int] = []
    resultArray.append(tempArray.max() ?? 0)
    resultArray.append(tempArray.min() ?? 0)
    
    resultArray.sort(by: >)
    if resultArray.isEmpty {
        resultArray = [0,0]
    }
    return resultArray
}

//print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]))
//print(solution(["I 16","D 1"]))
