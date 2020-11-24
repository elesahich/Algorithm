//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/29.
//  Copyright © 2020 elesahich. All rights reserved.
//  64064 불량 사용자

import Foundation

fileprivate func solution(_ user_id: [String], _ banned_id: [String]) -> Int {

    var matchingArray: [[String]] = Array(repeating: [], count: banned_id.count)

    banned_id.enumerated().forEach() { (index, value) in
        user_id.forEach() { (id) in
            let matches = value.replacingOccurrences(of: "*", with: ".")
            if matches.count == id.count {
                let val = id.getArrayAfterRegex(regex: matches)
                if !val.isEmpty {
                    matchingArray[index].append(val[0])
                }
            }
        }
    }
    
    var answer: [String] = []
    
    print(matchingArray)
    
    
    
    
    for match in matchingArray {
        for value in match {
            guard answer.count < banned_id.count else { continue }
            if answer.contains(value) == false {
                answer.append(value)
                break
            }
        }
    }

   
    print(answer)
    
    return 0
}

func dfs(_ arr: [String]) {
    
}

//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))

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

//func practiceDFS(numbers: [Int], m: Int) { // 1
//    var result = Array<[Int]>()
//
//    func dfs(selected: [Int]) {
//        guard selected.count < m else {
//            // 2
//            result.append(selected)
//            return
//        }
//        for number in numbers {
//            guard selected.contains(number) == false else { continue }
//            dfs(selected: selected + [number])
//        }
//    }
//    dfs(selected: [])
//    print(result)
//}
//
//practiceDFS(numbers: [1,2,4], m: 2)


    
    
    
