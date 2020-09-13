//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/13.
//  Copyright © 2020 elesahich. All rights reserved.
//  42839 소수찾기

import Foundation


private func solution(_ numbers: String) -> Int {
  let arr: [String] = numbers.map { (String($0)) } // 원본배열
  let n = arr.count
  var value: [Int] = [] // answer 값
  var output: [String] = Array(repeating: "", count: n)
  var visited: [Bool] = Array(repeating: false, count: n)

  for r in 1...n {
    permutation(arr, &output, &visited, 0, n, r, &value);
  }
  var answer: [Int] = []

  value.forEach {
    guard
      $0 != 0,
      $0 != 1,
      $0 % 2 != 0
    else { return }
    var i = 3
    while true {
      if $0 % i == 0 { break }
      if Double(i) > sqrt(Double($0)) { answer.append($0) ; break }
      i += 2
    }
  }
  if value.contains(2) { answer.append(2) }
  if value.contains(3) { answer.append(3) }

  return answer.count
}

//print(solution("1378"))

func permutation<T> (_ arr: [T], _ output: inout [T], _ visited: inout [Bool], _ depth: Int, _ n: Int, _ r: Int ,_ value: inout [Int]) {
  if (depth == r) {
    let temp = output as! [String] // 여기만 바꾸면 되넹
    let out = temp
      .filter { $0 != "" }
      .map { String($0) }
      .reduce("") { $0 + $1 }

    if !value.contains(Int(out)!) {
      value.append(Int(out)!)
    }
    return
  }

  for i in 0..<n {
    if visited[i] != true {
      visited[i] = true
      output[depth] = arr[i]
      permutation(arr, &output, &visited, depth + 1, n, r, &value)
      visited[i] = false
    }
  }
}
