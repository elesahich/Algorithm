//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/11/22.
//  Copyright © 2020 elesahich. All rights reserved.
//  설탕배달 

import Foundation

let input = readLine() ?? ""
let a = Int(input) ?? 0

var starter = a / 5

while starter >= 0 {
  let remain = a - (starter * 5)
  if remain % 3 == 0 {
    print(starter + remain / 3)
    break
  }
  starter = starter - 1
  if (starter == -1) {
    print(-1)
  }
}
