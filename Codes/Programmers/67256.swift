//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/11.
//  Copyright © 2020 elesahich. All rights reserved.
//  67256

import Foundation

private func solution(_ numbers: [Int], _ hand: String) -> String {
  
  var heightDic: [Int: Int] = [:]
  var rowDic: [Int: Int] = [:]
  for i in stride(from: -2, to: 10, by: 1) {
    if i == -1 || i == 0 || i == -2 { heightDic[i] = 4 }
    else if i == 1 || i == 2 || i == 3 { heightDic[i] = 1 }
    else if i == 4 || i == 5 || i == 6 { heightDic[i] = 2 }
    else { heightDic[i] = 3 }
  }
   
  for i in stride(from: -2, to: 10, by: 1) {      // -2 <= x < 10임;;
    if i == 1 || i == 4 || i == 7 || i == -1 { rowDic[i] = 1 }
    else if i == 2 || i == 5 || i == 8 || i == 0 { rowDic[i] = 2 }
    else { rowDic[i] = 3 }
  }
  
  var answer: String = ""
  var leftCurrent: Int = -1      // -1: *
  var rightCurrent: Int = -2     // -2: # 이렇게 하고
  
  numbers.forEach() {
    if $0 == 1 || $0 == 4 || $0 == 7 {
      answer.append("L")
      leftCurrent = $0
      return
    }
    else if $0 == 3 || $0 == 6 || $0 == 9 {
      answer.append("R")
      rightCurrent = $0
      return
    }
    else {
      let leftValue = abs(heightDic[$0]! - heightDic[leftCurrent]!) + abs(rowDic[$0]! - rowDic[leftCurrent]!)
      let rightValue = abs(heightDic[$0]! - heightDic[rightCurrent]!) + abs(rowDic[$0]! - rowDic[rightCurrent]!)
      
      if leftValue > rightValue {
        answer.append("R")
        rightCurrent = $0
        return
      } else if leftValue == rightValue {
        if hand == "right" {
          answer.append("R")
          rightCurrent = $0
        } else {
          answer.append("L")
          leftCurrent = $0
        }
      }
      else {
        answer.append("L")
        leftCurrent = $0
      }
    }
  }
  return answer
}

//print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
