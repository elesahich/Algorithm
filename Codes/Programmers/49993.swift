//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/10/06.
//  Copyright © 2020 elesahich. All rights reserved.
//  49993 스킬트리

import Foundation

func solution(_ skill: String, _ skill_trees: [String]) -> Int {

  var dic: [Character: Int] = [:]
  var checkArray = Array(repeating: false, count: dic.count)
  var arrayIdx = 0
  skill.enumerated().forEach {
    dic[$1] = $0
  }
  
  for i in skill_trees {
    for (j, k) in i.enumerated() {
      if dic[k] == arrayIdx {
        print(true)
      }
    }
  }
  
  
  
  
  
  return 0
}

//print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
