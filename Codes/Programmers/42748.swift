//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/25.
//  Copyright © 2020 elesahich. All rights reserved.
//  42748 K번째 수
    
import Foundation

private func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    var answer: [Int] = []
    commands.forEach() {
        let range = $0[0...1]
        let val = array[range[0]-1...range[1]-1]
            .sorted(by: { $0 < $1 })[$0[2]-1]
        answer.append(val)
    }
    return answer
}

//print(solution([1,5,2,6,3,7,4], [[2,5,3],[4,4,1],[1,7,3]]))
