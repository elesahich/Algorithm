//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/28.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

private func solution(_ s: String) -> Bool {
    var ans: Bool = true
    let originArray: String = s
    var count = 0 // index를 도입한 이유는 removeFirst()가 O(n)이라서 효율성을 못통과하네요
    
//        while !originArray.isEmpty {
//            let firstValue = originArray[index]
//            if firstValue == ")" && leftArray.isEmpty {
//                ans = false
//                break
//            } else if firstValue == ")" && !leftArray.isEmpty {
//                leftArray.removeFirst()
//
//            } else if firstValue == "(" {
//                leftArray.append(firstValue)
//            }
//        }
//        if !leftArray.isEmpty { ans = false }
    
    originArray.forEach() {
        if $0 == ")" && count == 0 {
            ans = false
            return
        } else if $0 == ")" && count != 0 {
            count += -1
        } else if $0 == "(" {
            count += 1
        }
    }
    if count != 0 { ans = false }

    return ans
}

//print(solution(")()("))
//print(solution("()()"))
//print(solution("()))((()"))
//

