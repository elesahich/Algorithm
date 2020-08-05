//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/05.
//  Copyright © 2020 elesahich. All rights reserved.
//  62048, 멀쩡한 사각형

import Foundation

// 시작시간 00:52

func solution(_ w: Int, _ h: Int) -> Int64 {
    var answer: Int64 = 0
    let constant: Double = Double(h) / Double(w) > 1 ? (Double(h) / Double(w)).rounded(.up) : (Double(w) / Double(h)).rounded(.up)

    func gcd(_ a: Int, _ b: Int) -> Int {
        let r = a % b
        if r != 0 { return gcd(b, r) }
        else { return b }
    }
    let checkGCD = gcd(w,h)

    answer = { () -> Int64 in
        var ans: Int64
        var temp: Double = 0
        let wid = Int64(w)
        let height = Int64(h)

        if w > h {
            ans = wid * height - Int64(constant) * height
            temp = ((Double(w) / Double(h) - Double( w / h))) * Double(h / checkGCD)
            if temp != 0 { temp += -1 }
            ans = ans - Int64(temp.rounded()) * Int64(checkGCD)
        } else {
            ans = wid * height - Int64(constant) * wid
            temp = ((Double(h) / Double(w) - Double( h / w)) * Double(w / checkGCD))
            if temp != 0 { temp += -1 }
            ans = ans - Int64(temp.rounded()) * Int64(checkGCD)
        }
        return ans
    }()
    return answer
}
print(solution(10234, 1777))

////
//print(solution(10234, 1777))
//print(solution(7, 14))  // 78
//print(solution(4, 8))   // 21
//print(solution(3, 9))   // 16
//print(solution(5, 10))  // 36
//print(solution(22, 11)) // 210
//print(solution(1, 2))
//print(solution(2, 4))
//print(solution(3, 6))
//print(solution(5, 5))
//print(solution(12, 152))
//print(solution(6, 22))
//print(solution(9999, 1323))
//print(solution(132, 133))
//print(solution(13, 17))
//print(solution(5, 18))
//print(solution(12, 8))
//print(solution(8, 12))

