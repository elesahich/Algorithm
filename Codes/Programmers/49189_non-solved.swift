//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/21.
//  Copyright © 2020 elesahich. All rights reserved.
//  49189 가장 먼 노드

import Foundation

//class Node<T> {
//  let value: T
//  var edges = [Edge<T>]()
//  var visited = false
//  init(value: T) {
//    self.value = value
//  }
//  
//  func appendEdgeTo(_ node: Node<T>) {
//    let edge = Edge<T>(from: self, to: node)
//    self.edges.append(edge)
//  }
//}
//
//class Edge<T> {
//  weak var source: Node<T>?
//  let destination: Node<T>
//  init(from source: Node<T>, to destination: Node<T>) {
//    self.source = source
//    self.destination = destination
//  }
//}
//
//func BFS(n: Int, edges: [(Int, Int)]) -> Int {
//  let nodes = (0..<n).map { Node<Int>(value: $0 + 1) }
//  for (from, to) in edges {
//    nodes[from - 1].appendEdgeTo(nodes[to - 1])
//  }
//  
//  var shortest = Array(repeating: [1], count: n)
//  var queue: [Node<Int>] = []
//  
//  queue.append(nodes[0])
//  nodes[0].visited = true
//  
//  while !queue.isEmpty {
//    let node = queue.removeFirst()
//    for edge in node.edges {
//      let dest = edge.destination
//      guard dest.visited == false else {
//        continue
//      }
//      queue.append(dest)
//      dest.visited = true // 2. Node를 방문할 때 해야하는 처리
//      shortest[dest.value - 1] = shortest[node.value - 1] + [dest.value]
//    }
//    print("shortest: \(shortest)" + "\n")
//  }
//
//  var maxCount = 0
//  shortest.forEach() {
//    maxCount = maxCount > $0.count ? maxCount : $0.count
//  }
//  print(maxCount)
//  var answer = 0
//  shortest.forEach() {
//    if maxCount == $0.count {
//      answer += 1
//    }
//  }
//  return answer
//}
//
//func solution(_ n: Int, _ edge: [[Int]]) -> Int {
//  var tuple: [(Int, Int)] = []
//  edge.forEach({
//    
//    let temptuple = $0[0] > $0[1] ? ($0[1]+1, $0[0]+1) : ($0[0]+1, $0[1]+1)
////    let temptuple = ($0[0], $0[1])
//    tuple.append(temptuple)
//  })
//  return BFS(n: n, edges: tuple)
//}

//print(solution(5, [[0,1], [0,2], [0,4], [1,2], [2,3], [2,4], [3,4]]))
//print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
//print(BFS(n: 6, edges: [(1,5), (2,4), (2,5), (3,2), (3,6), (4,2), (4,5), (5,3), (5,6)]))
//print(solution(6, [[1,5], [2,4], [2,5], [3,2], [3,6], [4,2], [4,5], [5,3], [5,6]]))
//print(solution(17, [[1, 2], [1, 3], [2, 4], [2, 5], [4, 9], [5, 10], [5, 11], [9, 15], [3, 6], [3, 7], [3, 8], [8, 14], [6, 12], [13, 6], [12, 16], [13, 17]]))

