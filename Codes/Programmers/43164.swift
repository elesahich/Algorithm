//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/01.
//  Copyright © 2020 elesahich. All rights reserved.
//  43164 여행경로
import Foundation

private func solution(_ tickets:[[String]]) -> [String] {
    var path: [String] = []
    var answer: [String] = []
    var visited: [Bool] = Array(repeating: false, count: tickets.count)
    let arr = tickets.sorted(by: { $0[1] < $1[1] })
    
    func dfs(_ depth: Int, _ airport: String, _ ticket: [[String]], _ answer: inout [String], _ visited: inout [Bool], _ path: inout [String]) {
        path.append(airport)
        
        if depth == ticket.count { answer = path; return }
        
        for i in 0..<ticket.count where answer.isEmpty {
            let infomation: (start: String, end: String) = (ticket[i].first!, ticket[i].last!)
            print(infomation)
            
            if visited[i] == false && airport == infomation.start {
                visited[i] = true
                dfs(depth + 1, infomation.end, ticket, &answer, &visited, &path)
                visited[i] = false
            }
        }
        // 조건에 안 맞으면 고
        path.removeLast()
    }
    
    dfs(0, "ICN", arr, &answer, &visited, &path)

    return answer
}

//print(solution([["ICN", "COO"], ["ICN", "BOO"], ["COO", "ICN"], ["BOO", "DOO"]]))


//func solution(_ tickets: [[String]]) -> [String] {
//
//    var ticket = tickets
//    var trace: [String] = ["ICN"]
//    var departure = "ICN"
//    var stoargeDic: [Int: [String]] = [:]
//    var count = 0
//
//    while count < tickets.count {
//        for (idx,value) in ticket.enumerated() {
//            let target = value[0]
//            if target == departure {
//                stoargeDic[idx] = value
//            }
//        }
//
//        let index = stoargeDic.values.sorted(by: { $0[1] < $1[1] })
//        trace.append(index[0][1])
//
//        ticket.enumerated().forEach() {
//            if !index.isEmpty {
//                if $1 == index[0] { ticket[$0] = ["-1"] }
//            }
//        }
//        count += 1
//        departure = index[0][1]
//        stoargeDic = [:]
//    }
//    return trace
//}

//print(solution([["ICN" ,"B"], ["ICN", "C"], ["C", "D"], ["D", "ICN"]]))
//print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
//print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
