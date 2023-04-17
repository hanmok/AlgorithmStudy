//
//  SeeSaw.swift
//  AlgorithmStudy
//
//  Created by Mac mini on 2023/04/15.
//

import Foundation

class SeeSaw {
    
    var multiplied = [[4, 3], [4, 2], [3, 4], [3, 2], [2, 3], [2, 4]]
    func solution(_ weights: [Int]) -> Int64 {
        var weights = weights.sorted()
        // 중복인 것들은 빼기! How ?
        var newWeights = [Int]()
        var weightCountDic = [Int: Int]() // 각 weight 의 갯수 체크
        
        var prev = 0
        var answer: Int64 = 0
        // MARK: - Duplicate
        for weight in weights {
            if prev == weight {
                weightCountDic[weight]! += 1
            } else {
                prev = weight
                newWeights.append(weight)
                weightCountDic[weight] = 1
            }
        }
        
//        var candidateDic = [Int: Int]()
        var candidates = [(Int, Int)]()
        
        // 짝꿍 될 수 있는 경우 찾아보기
        
        for (idx, newWeight) in newWeights.enumerated() {
            for secondIdx in (idx + 1) ..< newWeights.count {
                print("comparing: \(newWeight), \(newWeights[secondIdx])")
                if areCouple(newWeight, newWeights[secondIdx]) {
//                    candidateDic[newWeight] = newWeights[secondIdx]
                    candidates.append((newWeight, newWeights[secondIdx]))
                }
            }
        }
        
        // Same Weight -> nC2
        for (key, value) in weightCountDic {
            print("key: \(key), value: \(value)")
            answer += Int64(value * (value - 1) / 2)
        }
        
        // Different Weight - > N : N
        for candidate in candidates {
            answer += Int64(weightCountDic[candidate.0]! * weightCountDic[candidate.1]!)
            print("answer added, \(candidate.0), \(candidate.1)")
        }
        
        return answer
    }
    
    func areCouple(_ w1: Int, _ w2: Int) -> Bool {
        guard w1 != w2 else { return true }
        for multiply in multiplied {
            
            if w1 * multiply[0] == w2 * multiply[1] {
                print("true")
                return true }
        }
        return false
    }
}
