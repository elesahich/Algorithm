//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/12.
//  Copyright © 2020 elesahich. All rights reserved.
//  1

import Foundation

private func solution(_ new_id:String) -> String {
  
// check = s.getArrayAfterRegex(regex: ".{\(count)}") : 사용방법

  print(new_id.lowercased())
  let start = new_id.lowercased()    // 1
  let second = start.getArrayAfterRegex(regex: "[a-z0-9-_.]").joined() // 2
  let third = second.getArrayAfterRegex(regex: "[^.]{1,}").reduce("") { $0 + "." + $1 } // 3
  let fourth = third.trimmingCharacters(in: ["."])
  let fifth = fourth.isEmpty ? "a" : fourth
  let sixth = fifth.getArrayAfterRegex(regex: "[a-z0-9-_.]{1,15}").first ?? ""
  var sixthTwice = sixth.trimmingCharacters(in: ["."])
  print(sixth)
  if sixthTwice.count <= 2 {
    while sixthTwice.count < 3 {
      sixthTwice.append(sixth.last!)
    }
  }
  return sixthTwice
}


//print(solution("abcdefghijklmn.p"))
//print(solution("...!@BaT#*..y.abcdefghijkl"))

extension String {
    func getArrayAfterRegex(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..<self.endIndex, in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
