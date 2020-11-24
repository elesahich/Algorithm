//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/02.
//  Copyright © 2020 elesahich. All rights reserved.
//  64065
import Foundation

private func solution(_ s: String) -> [Int] {

    let ans = s
        .trimmingCharacters(in: ["{"])
        .trimmingCharacters(in: ["}"])
        .replacingOccurrences(of: "},{", with: ",")
        .split(separator: ",")

    var dic: [Int: Int] = [:]
    ans.enumerated().forEach() {
        let key = Int(String(describing: $1)) ?? 0
        let value = dic[key] ?? 0
        dic[key] = value + 1
    }

    var maxValue = 0
    var max = 0 // key임
    var answer: [Int] = []
    var count = 0
    let roopCount = dic.count

    while count < roopCount {
        for val in dic {
            if maxValue < val.value {
                maxValue = val.value
                max = val.key
            }
        }
        dic.removeValue(forKey: max)
        answer.append(max)
        maxValue = 0
        max = 0
        count += 1
    }
    return answer
}

//print(solution("{{20,111},{111}}"))
//print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))



//    let val = s
//        .replacingOccurrences(of: ",", with: "")
//        .replacingOccurrences(of: "{{", with: "")
//        .replacingOccurrences(of: "}}", with: "")
//        .replacingOccurrences(of: "}{", with: ",")
//        .split(separator: ",")
//
//    print(val)
//    var answer: [Int] = []
//    let ans = val
//        .sorted(by: { $0.count < $1.count })
//        .enumerated()
//        .forEach() {
//
//            if answer.isEmpty { answer.append(Int(String(describing: $1)) ?? 0) ; return }
//            $1.forEach() {
//                print($0)
//                if !answer.contains(Int(String(describing: $0)) ?? 0) { answer.append(Int(String(describing: $0)) ?? 0) }
//            }
////            answer.append((Int(String(describing: $1)) ?? 0) - answer[$0 - 1] )
//    }
//    print(answer)


//    var tempStorage: [Int] = []
//    var storage: [[Int]] = []
//    var flag = false
//    val.forEach() {
//        if $0 == "}" { flag = false ; storage.append(tempStorage) ; tempStorage = [] ; return }
//        if $0 == "{" { flag = true ; return }
//        if flag == true {
//            tempStorage.append(Int(String(describing: $0)) ?? 0)
//        }
//    }
//
//    let str = storage
//        .sorted(by: { $0.count < $1.count })
//        .filter() { $0 != [] }
//
//    var answer: [Int] = []
//    str.forEach() {
//        $0.forEach() { (val) in
//            if !answer.contains(Int(val)) {
//                answer.append(val)
//            }
//        }
//    }
//
//    return answer
