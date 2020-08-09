//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/09.
//  Copyright © 2020 elesahich. All rights reserved.
//  42840, 모의고사

import Foundation

func solution(_ answers: [Int]) -> [Int] {
    let arrayA = [1,2,3,4,5]
    let arrayB = [2,1,2,3,2,4,2,5]
    let arrayC = [3,3,1,1,2,2,4,4,5,5]
    
    var tempDictionary: [Int: Int] = [:]
    
    for index in 0..<answers.count {
        if answers[index] == arrayA[index % arrayA.count] { tempDictionary[1] = (tempDictionary[1] ?? 0) + 1 }
        if answers[index] == arrayB[index % arrayB.count] { tempDictionary[2] = (tempDictionary[2] ?? 0) + 1 }
        if answers[index] == arrayC[index % arrayC.count] { tempDictionary[3] = (tempDictionary[3] ?? 0) + 1 }
    }
    
    let result = tempDictionary.filter {
        $0.value == tempDictionary.values.max()!
    }.keys
    .sorted()
    
    return result
}

print(solution([1,3,2,4,2]))
print(solution([1,2,3,4,5]))
