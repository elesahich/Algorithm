//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/17.
//  Copyright © 2020 elesahich. All rights reserved.
//
//

import Foundation

func solution(_ land: [[Int]]) -> Int {

    var territory = land
    for index in 0..<land.count {
        guard index != 0 else { continue }
        
        territory[index][0] += max(territory[index-1][1], territory[index-1][2], territory[index-1][3])
        territory[index][1] += max(territory[index-1][0], territory[index-1][2], territory[index-1][3])
        territory[index][2] += max(territory[index-1][0], territory[index-1][1], territory[index-1][3])
        territory[index][3] += max(territory[index-1][0], territory[index-1][1], territory[index-1][2])
    }

    return (territory.last?.max() ?? 0)
}

//func solution(_ land: [[Int]]) -> Int{
//
//    var beforeIndex = 0
//    var maxValues = 0
//
//    for index in 0..<land.count - 1 {
//        var maxValue = land[index].max() ?? 0
//        var maxIndex = land[index].firstIndex { $0 == maxValue } ?? 0
//
//        if maxIndex == beforeIndex {
//            let temparr = land[index].filter { $0 != maxValue }
//            maxValue = temparr.max() ?? 0
//            maxIndex = land[index].firstIndex { $0 == maxValue } ?? 0
//        }
//
//        maxValues += maxValue
//        beforeIndex = maxIndex
//    }
//
//    return maxValues
//}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
