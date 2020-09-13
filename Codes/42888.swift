//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/10.
//  Copyright © 2020 elesahich. All rights reserved.
//  오픈채팅방 : 42888

import Foundation

private func solution(_ record:[String]) -> [String] {
  
  var dict: [String : String] = [:]
  var stack: [(id: String, state: String)] = []
  
  for element in record {
    let list = element.split(separator: " ").map{ String($0) }
    let state = list[0]
    let userid = list[1]
    
    if state == "Enter" || state == "Leave"{
      stack.append((userid, state))
      if state == "Enter"{
        let name = list[2]

        if let _ = dict[userid] {
          dict[userid] = name
        }
        else{
          dict[userid] = name
        }
      }
    }
    else if state == "Change" {
      let name = list[2]
      dict[userid] = name
    }
  }

  var answer : [String] = []
  for element in stack {
    let name = dict[element.id]!
    let commend = element.state
    
    if commend == "Enter"{
      answer.append("\(name)님이 들어왔습니다.")
    } else if commend == "Leave"{
      answer.append("\(name)님이 나갔습니다.")
    }
  }
  return answer
}

//print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
