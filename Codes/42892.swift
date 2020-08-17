//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/15.
//  Copyright © 2020 elesahich. All rights reserved.
//  길찾기 게임 : 42892

import Foundation

// root랑 Current를 만들어서 가면 됩니다

public class BinaryNode<T> {
    public var value: T
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    public init(value: T) {
        self.value = value
    }
    public func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    public func traversePreOrder(visit: (T) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    public func traversePostOrder(visit: (T) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

func setupBinaryTree(_ array: [[Int]], _ current : BinaryNode<[Int]>, _ idx: Int) {
    
    if current.value[1] > array[idx][1] {
        if current.leftChild == nil {
            current.leftChild = BinaryNode(value: array[idx])
        } else {
            guard let root = current.leftChild else { return }
            setupBinaryTree(array, root, idx)
        }
    } else {
        if current.rightChild == nil {
            current.rightChild = BinaryNode(value: array[idx])
        } else {
            guard let root = current.rightChild else { return }
            setupBinaryTree(array, root, idx)
        }
    }
}

func solution(_ nodeinfo: [[Int]]) -> [[Int]] {
    // 0 : Input Array의 Index, 1 : 정렬된 Array의 X값, 2: 정렬된 Array의 Y값
    var tuple: [[Int]] = []
    for index in 0..<nodeinfo.count {
        tuple.append([index + 1,
                      nodeinfo[index][0],
                      nodeinfo[index][1]])
    }
    let inputArray = tuple.sorted(by: { $0[2] > $1[2] })
    let root: BinaryNode<[Int]> = BinaryNode(value: inputArray[0])

    
    for index in 0..<inputArray.count {
        guard index != 0 else { continue }
        if root.value[1] > inputArray[index][1] {
            if root.leftChild == nil {
                root.leftChild = BinaryNode(value: inputArray[index])
            } else {
                guard let current = root.leftChild else { continue }
                setupBinaryTree(inputArray, current, index)
            }
        } else {
            if root.rightChild == nil {
                root.rightChild = BinaryNode(value: inputArray[index])
            } else {
                guard let current = root.rightChild else { continue }
                setupBinaryTree(inputArray, current, index)
            }
        }
    }
    var order: [Int] = []
    var returnArray: [[Int]] = []
    root.traversePreOrder {
        order.append($0[0])
    }
    returnArray.append(order)
    order = []
    root.traversePostOrder {
        order.append($0[0])
    }
    returnArray.append(order)
    
    return returnArray
}

//print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))

