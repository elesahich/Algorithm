//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/15.
//  Copyright © 2020 elesahich. All rights reserved.
//  43162

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
//func BFS(n: Int, edges: [(Int, Int)]) {
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
//  }
//  print(shortest)
//}

//BFS(n: 6, edges: [(1,5), (2,4), (2,5), (3,2), (3,6), (4,2), (4,5), (5,3), (5,6)])




