//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/20.
//  Copyright © 2020 elesahich. All rights reserved.
//  42579 베스트앨범

import Foundation

// 0. 장르 당 2개씩 수록
// 1. 많이 재생된 장르일수록 먼저 수록
// 2. 장르 안에서는 많이 재생된 노래를 먼저 수록
// 3. 1/2를 동시에 만족하는 경우 고유번호가 낮은 노래를 먼저 수록

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {

    var set: Set<String> = []
    genres.forEach { set.insert($0) }
    let setGenres = Array(set)
    
    var storageArray: [[Int]] = Array(repeating: [], count: setGenres.count)
    var acculmulateArray: [Int] = Array(repeating: 0, count: setGenres.count)
    
    for i in 0..<setGenres.count {
        for j in 0..<genres.count {
            if setGenres[i] == genres[j] {
                storageArray[i].append(plays[j])
                acculmulateArray[i] += plays[j]
            }
        }
    }
    
    print(storageArray)
    var acculmulateDic: [Int: Int] = [:]
    acculmulateArray.enumerated().forEach {
        acculmulateDic[$0] = $1
    }
    let sortedDic = acculmulateDic.sorted(by: { $0.value > $1.value })
    var returnArray: [Int] = []
    
    sortedDic.forEach {
        let temp = storageArray[$0.key].sorted(by: >)
        
        for j in 0..<temp.count {
            guard j < 2 else { continue }
            returnArray.append(temp[j])
        }
    }

    // 중복체크 //
    var array: [Int] = []
    var playarray: [Int] = plays
    for i in 0..<returnArray.count {
        array.append(playarray.firstIndex(of: returnArray[i]) ?? 0)
        playarray[playarray.firstIndex(of: returnArray[i]) ?? 0] = -1
    }
    print(playarray)
    
    return array
}

//print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 500, 800, 2500]))
print(solution(["classic", "pop", "classic", "pop", "classic", "classic"] , [400,600,150,2500,500,500]))
