//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/06.
//  Copyright © 2020 elesahich. All rights reserved.
//  42587, 프린터

import Foundation

private func solution(_ priorities: [Int], _ location: Int) -> Int {
    var count = 0
    var targetLoaction = location
    var printerQueue: [Int] = priorities
    let priorityAtLoaction = priorities[location]
    
    while !printerQueue.isEmpty {
        let maxPriority = printerQueue.max() ?? 0
        if printerQueue.first ?? 0 < maxPriority {
            let first = printerQueue.removeFirst()
            printerQueue.append(first)
            targetLoaction = targetLoaction != 0 ? targetLoaction - 1 : printerQueue.count - 1
        } else {
            let first = printerQueue.removeFirst()
            if first != priorityAtLoaction {
                count += 1
                targetLoaction = targetLoaction != 0 ? targetLoaction - 1 : printerQueue.count - 1
            } else if targetLoaction == 0 && first == priorityAtLoaction {
                count += 1
                break
            } else {
                count += 1
                targetLoaction = targetLoaction != 0 ? targetLoaction - 1 : printerQueue.count - 1
            }
        }
    }
    return count
}

//print(solution([2, 1, 3, 2], 2)) // return 1
//print(solution([1, 1, 9, 1, 1, 1], 0)) // return 5
