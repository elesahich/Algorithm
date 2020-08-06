//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/06.
//  Copyright © 2020 elesahich. All rights reserved.
//  42583

import Foundation

// 풀이 시작 : 12 : 33

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    
    var pendingQueue = QueueArray<Int>()
    var bridgeQueue = QueueArray<Int>()
    
    for index in 0..<truck_weights.count { pendingQueue.enQueue(truck_weights[index]) }
    for _ in 0..<bridge_length { bridgeQueue.enQueue(0) }
    
    var currentWeight: Int = 0
    var countsOfPassedTruck = 0
    var count = 0
    
    while countsOfPassedTruck != truck_weights.count {
        let deque = bridgeQueue.deQueue() ?? 0
        if deque != 0 {
            countsOfPassedTruck += 1
        }
        currentWeight += -deque
        let enque = pendingQueue.peek ?? 0
        
        if currentWeight + enque > weight {
            bridgeQueue.enQueue(0)
        } else {
            bridgeQueue.enQueue((pendingQueue.deQueue() ?? 0))
            currentWeight += enque
        }
        count += 1
    }
    
    return count
}

print(solution(2, 10, [7,4,5,6]))

public protocol Queue {
    associatedtype Element
    mutating func enQueue(_ element: Element) -> Bool
    mutating func deQueue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
public struct QueueArray<T>: Queue {
    
    public mutating func deQueue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    private var array = Array<T>()
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var peek: T? {
        return array.first
    }
    public mutating func enQueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
}

