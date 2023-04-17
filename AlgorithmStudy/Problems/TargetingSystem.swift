//
//  TargetingSystem.swift
//  AlgorithmStudy
//
//  Created by Mac mini on 2023/04/14.
//

import Foundation

class TargetingSystem {
    func solution(_ targets: [[Int]]) -> Int {
        let targets = targets.sorted { num1, num2 in
            return num1[0] < num2[0]
        }
        
        var targetIndex = 0
        var maxStart = targets[0][0]
        var minEnd = targets[0][1]
        var answer = 0
        
        for target in targets {
            
            if target[0] >= maxStart {
                if target[1] > minEnd {
                    maxStart = target[0]
                } else {
                    maxStart = target[0]
                    minEnd = target[1]
                }
            }
            
            if target[0] >= maxStart && target[1] > minEnd {
                maxStart = target[0]
            } else if target[0] >= maxStart && target[1] <= minEnd {
                maxStart = target[0]
                minEnd = target[1]
            } else if target[0] >= minEnd { // 발사!
                maxStart = target[0]
            }
            
//            print("target: \(target), maxStart: \(maxStart), minEnd: \(minEnd), answer: \(answer)")
            
            if maxStart >= minEnd {
                print("fired!")
                answer += 1
                maxStart = target[0]
                minEnd = target[1]
//                print("reset maxStart: \(maxStart), minEnd: \(minEnd), answer: \(answer)")
            }
        }
        answer += 1
        return answer
    }
}
