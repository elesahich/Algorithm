//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/14.
//  Copyright © 2020 elesahich. All rights reserved.
//  42842 카펫

import Foundation

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    
    let value = brown + yellow
    var array: [[Int]] = []
    for index in 0..<value/2 {
        guard
            index != 0,
            index != 1
            else { continue }
        if value % index == 0 {
            let quotient = value/index
            let tuple: [Int] = [quotient, index]
            array.append(tuple)
        }
    }

    return array.filter({ ($0[0]-2) * ($0[1]-2) == yellow }).first?.sorted(by: >) ?? []
}

//print(solution(24, 24))
//print(solution(10, 2))
