//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/03.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// 시작시간 19:12

func solution(_ progress: [Int], _ speeds: [Int]) -> [Int] {
    // 뒤에 있는 기능은 앞에 있는기능이 배포될 때 함께 배포
    // 각 배포마다 몇개의 기능이 배포되는지를 return
    let progressArray = progress
    let speedsArray = speeds
    let maxPercentage = 100
    
    var completionArray: [Int] = []
    var returnArray: [Int] = []
    
    for index in 0..<progressArray.count {
        let eachValue = maxPercentage - progressArray[index]
        var estimatedLeftDays: Double = (Double(eachValue) / Double(speedsArray[index]))
        estimatedLeftDays = estimatedLeftDays.rounded(.up)
        completionArray.append(Int(estimatedLeftDays))
        
        //        print("before: \(completionArray)")
        guard index != 0
            else { continue }
        
        if completionArray[index] < completionArray[index - 1] {
            completionArray[index] = completionArray[index - 1]
        }
    }
    print(completionArray)
//    let set = Set(completionArray)
//    let array = Array(set)
    let flag = true
    var i = 1
    var count = 1
    var beforeValue = completionArray[0]
    
    while(flag) {
        
        if i == completionArray.count {
            returnArray.append(count)
            break
        }
        if completionArray[i] == beforeValue {
            print("i: \(i), beforeValue: \(beforeValue)")
            count += 1
        } else {
            beforeValue = completionArray[i]
            returnArray.append(count)
            count = 1
            print("i: \(i), beforeValue: \(beforeValue)")

        }
        i += 1
    }
    return returnArray
}

print(solution([93,30,55], [1,30,5]))
//print(solution([92,25,51,20,70], [3,50,10,10,30]))
