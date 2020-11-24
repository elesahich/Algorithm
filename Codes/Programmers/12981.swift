//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/14.
//  Copyright © 2020 elesahich. All rights reserved.
//  12981 끝말잇기

import Foundation

private func solution(_ n: Int, _ words: [String]) -> [Int] {
  
  var beforeLast: String = ""
  var failureIndex: Int = 0
  var storage: [String] = []
  
  for (idx, value) in words.enumerated() {
    print(idx, value)
    
    guard idx != 0 else {
      beforeLast = String(value.last!)
      storage.append(value)
      continue
    }
    
    print(idx, storage)
    if String(value.first!) != beforeLast || storage.contains(String(value)) {
      failureIndex = idx
      beforeLast = String(value.last!)
      break
    }
    beforeLast = String(value.last!)
    storage.append(value)

  }
  let answer = failureIndex == 0 ? 0 : (failureIndex % n) + 1
  let failurePersonIdx: Int = failureIndex == 0 ? 0 : (failureIndex / n) + 1
  
  return [answer, failurePersonIdx]
}

//print(solution(2, ["land", "dream", "mom", "mom", "ror"]))
//print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]))
//print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
//print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
