//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/31.
//  Copyright © 2020 elesahich. All rights reserved.
//  60057 문자열압축

import Foundation

private func solution(_ s: String) -> Int {
    
    var count = 1
    var check: [String] = []
    var value = s.count
        
    print(s.count)
    
    while count <= s.count/2 {
        check = s.getArrayAfterRegex(regex: ".{\(count)}")
        count += 1
//        print("check: \(check)")
        var checkStack: [String] = []
        var answer: [String] = []
        let tmp = check.joined().count
        if tmp != s.count { check.append("\(s[s.index(s.startIndex, offsetBy: tmp)...])") }
        print("check: \(check)")
        
        for (idx, value) in check.enumerated() {
            if checkStack.isEmpty { checkStack.append(value) }
            else {
                if checkStack.last == value {
                    checkStack.append(value)
                } else {
                    if checkStack.count == 1 {
                        answer.append(checkStack[0])
                        checkStack.removeAll()
                        checkStack.append(value)
                    } else {
                        answer.append("\(checkStack.count)"+"\(checkStack[0])")
                        checkStack.removeAll()
                        checkStack.append(value)
                    }
                }
                if idx == check.count - 1 {
                    if checkStack.count == 1 {
                        answer.append(checkStack[0])
                        checkStack.removeAll()
                    } else {
                        answer.append("\(checkStack.count)"+"\(checkStack[0])")
                        checkStack.removeAll()
                    }
                }
            }
        }
        value = value > answer.joined().count ? answer.joined().count : value
    }
    return value
}

//print(solution("aabbaccc"))
//print(solution("ababcdcdababcdcd"))
//print(solution("abcabcdede"))
//print(solution("xababcdcdababcdcd"))

//extension String {
//    func getArrayAfterRegex(regex: String) -> [String] {
//        do {
//            let regex = try NSRegularExpression(pattern: regex)
//            let results = regex.matches(in: self,
//                                        range: NSRange(self.startIndex..<self.endIndex, in: self))
//            return results.map {
//                String(self[Range($0.range, in: self)!])
//            }
//        } catch let error {
//            print("invalid regex: \(error.localizedDescription)")
//            return []
//        }
//    }
//}
