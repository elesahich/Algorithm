//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/24.
//  Copyright © 2020 elesahich. All rights reserved.
//  42746 가장 큰 수

import Foundation

func solution(_ numbers: [Int]) -> String {
  var answer = numbers
    .sorted() { Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    .reduce("") { String($0) + String($1) }
  if Int(answer) == 0 {
    answer = "0"
  }
  
  return answer
}

//print(solution([3, 30, 34, 5, 9]))
//print(solution([6,2,10]))

