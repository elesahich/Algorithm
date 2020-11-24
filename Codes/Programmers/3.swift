//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/12.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

func solution(_ info: [String], _ query: [String]) -> [Int] {
  
  var inforArr: [[String]] = []
  info.forEach {
    let temp = $0.split(separator: " ").map { String($0) }
    inforArr.append(temp)
  }
  
  var queryString: [[String]] = []
  query.forEach {
    let q = $0.split(separator: " ").filter { $0 != "and" }.map { String($0) }
    queryString.append(q)
  }
  
  
  var answer: [Int] = []
  var count = 0
  queryString.enumerated().forEach {
    for i in 0..<inforArr.count {
      if ($1[0] == inforArr[i][0] || $1[0] == "-")
        && ($1[1] == inforArr[i][1] || $1[1] == "-")
        && ($1[2] == inforArr[i][2] || $1[2] == "-")
        && ($1[3] == inforArr[i][3] || $1[3] == "-")
        && (Int($1[4])! <= Int(inforArr[i][4])! || $1[4] == "-") {
        count += 1
      }
    }
    answer.append(count)
    count = 0
  }
  return answer
}


//print(solution(
//  ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"],
//  ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]
//))
