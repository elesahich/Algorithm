//
//  main.swift
//  Algorithm
//
//  Created by elesahich on 2020/09/10.
//  Copyright © 2020 elesahich. All rights reserved.
//  11811 수식 최대화

import Foundation

private func solution(_ expression: String) -> Int64 {
  
  let defaultOp = ["+","-","*"]
  var operand = expression
    .replacingOccurrences(of: "+", with: " ")
    .replacingOccurrences(of: "-", with: " ")
    .replacingOccurrences(of: "*", with: " ")
    .split(separator: " ")
    .map { String($0) }
  
  var op: [String] = []
  expression.forEach {
    if defaultOp.contains(String($0)) { op.append(String(describing: $0)) }
  }
  let defalutOp = op
  let defaultOperand = operand
  let binaryOp = [
    ["+", "-", "*"],
    ["+", "*", "-"],
    ["-", "+", "*"],
    ["-", "*", "+"],
    ["*", "-", "+"],
    ["*", "+", "-"]
  ]
  var answer: [Int] = []
  for value in binaryOp {
    op = defalutOp
    operand = defaultOperand
    for operat in value {
      guard op.contains(operat) else { continue }
      while op.contains(operat) {
        let idx = op.firstIndex(of: operat) ?? 0
        var mathValue = 0
        if op[idx] == "+" { mathValue = Int(operand[idx])! + Int(operand[idx+1])! }
        else if op[idx] == "-" { mathValue = Int(operand[idx])! - Int(operand[idx+1])! }
        else { mathValue = Int(operand[idx])! * Int(operand[idx+1])! }
        
        //        let mathExpression = NSExpression(format: operand[idx] + op[idx] + operand[idx+1])
        //        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as! Int
        op.remove(at: idx)
        operand.replaceSubrange(Range(idx...idx+1), with: ["\(mathValue)"])
      }
    }
    answer.append(abs(Int(operand.first ?? "") ?? 0))
  }
  return Int64(answer.max() ?? 0)
}

//print(solution("100-200*300-500+20"))
//print(solution("50*6-3*2"))
//func dfs(_ operators: inout [String], _ operand: inout [String]) -> ([String], [String]) {
//  return ([],[])
//}
