//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/21.
//  Copyright © 2020 elesahich. All rights reserved.
//  42883 큰 수 만들기

import Foundation

//func solution(_ number: String, _ k: Int) -> String {
//    var mapNumber = number.map { String($0) }
//
//    // 생각을 어케 해야될지 잘 모르겠는데용...
//    // number의 Count에서 순서를 보장해서 K개 삭제 후 max() 리턴을 해주면 어떨까
//    // K개를 삭제하는 방식은 number.count - K개만큼 뽑음
//    /// number.count `C` number.count - k
//    // 이렇게 하면 미래가 없다....진짜..
//
//    // 맨 처음 :
//    // 0부터 k번째 인덱스까지중에 제일 큰 수
//    // count ~ k + count 수 중에 제일 큰 수
//    // k + count > mapNumber.count이면 반복문 종료
//
//    var frontIdx = 0
//    var tempInteger: String = ""
//    var value = ""
//
//    print(number)
//    while k + frontIdx < mapNumber.count {
//        // k+1번 인덱스까지 돌면 끝
//        for index in 0 + frontIdx..<k + 1 + frontIdx {
//            tempInteger.append(mapNumber[index])
//        }
//
//        print(tempInteger)
//        for index in 0 + frontIdx..<k + 1 + frontIdx {
//            if mapNumber[index] == String(tempInteger.max() ?? Character("")) {
//                mapNumber[index] = "-1"
//                break
//            }
//        }
//        value.append(tempInteger.max() ?? Character(""))
//
//        frontIdx += 1
//        tempInteger = ""
//    }
//    return value
//}

func solution(_ number: String, _ k: Int) -> String {
    let mapArray = number.map { String($0) }
    var storage: [String] = [mapArray[0]]
    var removedCount = 0
    var idx = 1
    
    while removedCount != k {
        if idx >= mapArray.count {
            storage = []
            storage.append(contentsOf: mapArray[0...mapArray.count-k])
            break
        }
        while mapArray[idx] > storage.last ?? "" && !storage.isEmpty && removedCount != k {
            storage.removeLast()
            removedCount += 1
        }
        if removedCount == k {
            storage.append(contentsOf: mapArray[idx...])
            break
        }
        storage.append(contentsOf: [mapArray[idx]])
        idx += 1
    }
    return String(storage.joined().prefix(number.count-k))
}
//print(solution("4177252841", 4))
//print(solution("1924", 2))
//print(solution("999", 2))
