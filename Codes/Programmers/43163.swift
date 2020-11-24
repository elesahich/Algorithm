//
//  43163.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/10.
//  Copyright © 2020 elesahich. All rights reserved.
//  43163 단어 변환

import Foundation

private func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    return diffCount(begin, target, words, 0)
}

func diffCount(_ begin: String, _ target: String, _ wordArray: [String], _ count: Int) -> Int {
    var matchArray: [Int] = []
    var difference: [Int] = []
    var words = wordArray
    var before: String = ""
    print("begin: \(begin)")
    
    wordArray.enumerated().forEach { (idx, val) in
        let dif = zip(begin,wordArray[idx]).filter { $0 != $1 }
        difference.append(dif.count)
    }
    print(difference, words, begin, count)
    
    for index in 0..<difference.count {
        if difference[index] == 1 {
            before = words[index]
            words[index] = "-1"
            matchArray.append(index)
        }
    }
    var flag = false
    for index in 0..<matchArray.count {
        let testWord = wordArray[matchArray[index]]
        if testWord == target {
            flag = true
            return count + 1
        }
    }
    
    if flag == false {
        matchArray = []
        difference = []
        return diffCount(before, target, words, count+1)
    }
}

//print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
//print(solution("hit", "cog", ["hot", "dog", "dot", "lot", "log" ]))
