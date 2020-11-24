//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/12.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

private var dic: [String: Int] = [:]

private func solution(_ orders: [String], _ course: [Int]) -> [String] {

  var value: [String] = []
  
  for r in course {
    for val in orders {
      let arr: [String] = val.map { String($0) }
      let n = arr.count
      var combArr: [String] = Array(repeating: "", count: n)
      doCombination(&combArr, n, r, 0, 0, arr, &value)
    }
  }
  print(dic)
  for v in dic {
    print(v)
    if v.key.count == 2 {
      print(v)
    }
  }

  return []
}

//print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))
//print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))

func doCombination(_ combArr: inout [String], _ n: Int, _ r: Int, _ index: Int, _ target: Int, _ arr: [String], _ val: inout [String]) -> Void {
  var temp: [String] = []

  if r == 0 {
    for i in 0..<index {
      temp.append(arr[Int(combArr[i])!])
    }

    let value = dic[temp.joined()] ?? 0
    dic[temp.joined()] = value + 1

  } else if target == n { return }
  else {
    combArr[index] = String(target)
    doCombination(&combArr, n, r-1, index+1, target+1, arr, &val) // (i)
    doCombination(&combArr, n, r, index, target+1, arr, &val) // (ii)
  }
}

//func permutation(_ arr: [String] , _ output: [String], _ visited: [Bool], _ depth: Int, _ n: Int, _ r: Int) {
//  let arr = arr
//  var output = output
//  var visited = visited
//
//  if depth == r {
//    // stack.append(output)
//    print(output.sorted().joined())
//    return
//  }
//  for i in 0..<n {
//    if visited[i] != true {
//      visited[i] = true
//      output[depth] = arr[i]
//      permutation(arr, output, visited, depth + 1, n, r)
//      output[depth] = ""
//      visited[i] = false
//    }
//  }
//}
//



//var answer = 0
//let arr = ["A","B","C","D","E"]
//let n = arr.count
//let r = 2
//let output : [String] = Array(repeating: "", count: r)
//let visited : [Bool] = Array(repeating: false, count: n)
//permutation(arr,output,visited,0,n,r)


