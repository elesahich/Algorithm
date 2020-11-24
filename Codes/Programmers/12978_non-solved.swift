//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/08/23.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// 생각 :
// 1. N의 개수만큼 노드를 생성: Array 인덱스도 생성
// 2. 1번부터, inf인것과 아닌것을 만듬
// 3. 이제 inf를 한개씩 갱신하러 갑니다

// 1 >> 2
// 1 >> 3
// 1 >> 4
// 1 >> 5

// 딕셔너리를 여러개를 만드러놓자
// 3개의 해시 테이블이 필요하대
// 1에서 출발할거고
// 그래프 :   let graph = [Int: [Int:Int]] 개수는 들어올거고
//          let costs = [Int: Int] 개수는 N-1개
//          let parents = [Int: Int]

private func solution(_ N: Int, _ road: [[Int]], _ k: Int) -> Int {
    
    var costs: [Int: Int] = [:]
    var parents: [Int: Int] = [:]
    
    for i in 1..<N {
        costs[i+1] = -1
        parents[i+1] = -1
    }
    // 이제 cost와 parents를 생성할거야
    print(costs, parents)
    
    return 0
}

//print(solution(5, [[1,2,1], [2,3,3], [5,2,2], [1,4,2], [5,3,1], [5,4,2]], 3))
