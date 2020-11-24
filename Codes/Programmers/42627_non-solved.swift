//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/19.
//  Copyright © 2020 elesahich. All rights reserved.
//  42627 디스크 컨트롤러


/// `대기시간의 평균을 가장 최소화`
// 그럼 필요한 queue는, wait queue, pending queue, process queue가 됩니다
// 다시 정리하면, process queue에는 하나밖에 들어올 수 없고,
// if !processQueue.isEmpty {
// pendingQueue.first를 append
// else { 이제 검사 로직 짜는데.
// waitingQueue는 이미 정렬이 되어있음 (first가 빠른 순으로)
// pendingQueue.dropFirst.last! < waitingQueue[i].first 한번에 검사를 하는 경우 그때마다 빼는건 사실 말이 안되나? 아니면 while true를 돌려놓고 빼도 됩니다(O)


import Foundation

private func solution(_ jobs: [[Int]]) -> Int {
  
  var waitingQueue = jobs.sorted(by: { $0[0] < $1[0] })
  var pendingQueue: [[Int]] = []
  var currentQueue: [Int] = []
  var current: Int = 0
  
  while !waitingQueue.isEmpty {
    if currentQueue.isEmpty { currentQueue = waitingQueue.removeFirst() ; continue }
    else {
      
      for e in waitingQueue.indices {
        if currentQueue[1] > waitingQueue.removeFirst()[0] { // 얘는 반영이 될 것 같은데
          
        }
        else {
            break
        }
        
        pendingQueue.append(waitingQueue.removeFirst())
        pendingQueue.sort(by: { $0[1] < $1[1] })
        
      }
    }
  }
  return 0
}

//print(solution([[0, 3], [1, 9], [2, 6]]))
