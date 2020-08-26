//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/26.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

func solution(_ citations: [Int]) -> Int {
    let arr = citations.sorted(by: >)
    for (idx, value) in arr.enumerated() {
        if idx >= value {
            return idx
        }
    }
    
    return citations.count
}

//print(solution([3,0,6,1,5]))
print(solution([22, 42]))
//print(solution([2,2,2,2,2,2]))

