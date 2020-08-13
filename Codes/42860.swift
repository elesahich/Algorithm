//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/12.
//  Copyright © 2020 elesahich. All rights reserved.
//  42860 조이스틱
//  너무 화가나는 문제

import Foundation

private func solution (_ name: String) -> Int {
    var count = 0
    var left = name.count - 1
    var right = 1
    var currentIndex = 0
    var leftCount = 1
    var rightCount = 1
    var leftDistance = 1
    var rightDistance = 1
    
    var arr = Array(repeating: 0, count: name.count)
    let checkArray = Array(repeating: -1, count: name.count)
    
    let asciiArray = name.map { val -> Int in
        let temp = Int(val.asciiValue ?? 0)
        let value = abs(temp - 65) > 13 ? 26 - abs(temp - 65) : abs(temp - 65)
        return value
    }
    count += asciiArray[0]
    arr[0] = -1
    print(asciiArray)
    
    while true {
        right = right > name.count - 1 ? 0 : right
        right = right < 0 ? name.count - 1 : right
        left = left < 0 ? name.count - 1 : left
        left = left > name.count - 1 ?  0 : left
        
        if checkArray == arr {
            break
        }
        
        if asciiArray[left] == 0 {
            arr[left] = -1
            left -= 1
            leftCount += 1
            continue
        }
        if asciiArray[right] == 0 {
            arr[right] = -1
            right += 1
            rightCount += 1
            continue
        }
        if leftCount != 1 {
            leftDistance = leftCount
            leftCount = 1
        }
        if rightCount != 1 {
            rightDistance = rightCount
            rightCount = 1
        }
        
        if asciiArray[left] + leftDistance >= asciiArray[right] + rightDistance {
            // 오른쪽으로 감
            guard arr[right] != -1 else {
                right += 1
                rightCount += 1
                continue
            }
            count += asciiArray[right] + rightDistance
            currentIndex = right
//            count += right - currentIndex // 아닐 수도 있져?
            arr[right] = -1
            right = currentIndex + 1
            left = currentIndex - 1
            leftDistance = 1
            rightDistance = 1
        } else {
            guard arr[left] != -1 else {
                // 왼쪽으로 감
                left -= 1
                leftCount += 1
                continue
            }
            count += asciiArray[left] + leftDistance
            arr[left] = -1
            currentIndex = left
            right = currentIndex + 1
            left = currentIndex - 1
            leftDistance = 1
            rightDistance = 1
        }
        print(leftDistance, rightCount, count)
    }
    return count
}

//print(solution("JANJAZ"))
//print(solution("AABAAAAAAAB"))
//print(solution("AAABAA"))
//print(solution("AAAAAAAA"))
//print(solution("ABBBBAAAAABAAA"))
//print(solution("AZAAAZ"))
//print(solution("JAZ"))
//print(solution("AAAAAZZZ"))
//print(solution("BBAAAAABB"))
//print(solution("JEOREN"))
