//
//  Mining.swift
//  AlgorithmStudy
//
//  Created by Mac mini on 2023/04/17.
//

import Foundation

class Mining {
    
    // 최소 피로도
    func solution(_ picks:[Int], _ minerals:[String]) -> Int {
        var minerals = minerals
        let mineralInfoDic: [String: Int] = ["diamond": 25, "iron": 5, "stone": 1]
        
        // 광물이 더 많은 경우 남는 광물 제거
        let numOfPicks = picks.reduce(0, +)
        
        while minerals.count > numOfPicks * 5 {
            minerals.removeLast()
        }
        
        // 5개씩 자르고, 자른 것들 총 피로도 환산해서 넣기.
        var newMinerals = [[Int]]() // [TotalFatigue, numOfMinerals]
        for (idx, mineral) in minerals.enumerated() {
            let fatigue = mineralInfoDic[mineral]!
            if idx % 5 != 0 {
                let lastIdx = newMinerals.count - 1
                newMinerals[lastIdx][0] += fatigue
                newMinerals[lastIdx][1] += 1
            } else {
                newMinerals.append([fatigue, 1])
            }
        }
        
        //        newMinerals.sort(by: >) // 내림차순 정렬
        newMinerals.sort { arr1, arr2 in
//            if arr1[0] != arr2[0] {
//                return arr1[0] > arr2[0]
//            } else {
//                return arr1[1] > arr2[1]
//            }
            return arr1[0] != arr2[0] ? arr1[0] > arr2[0] : arr1[1] > arr2[1]
        }
        
        var newPicks = [Int]()
        for (idx, p) in picks.enumerated() {
            for _ in 0 ..< p {
                newPicks.append(idx)
            }
        }
        
        var fatigue = 0
        for (mineralIdx, newMineral) in newMinerals.enumerated() {
            if mineralIdx != newMinerals.count - 1 {
                let numOfDias = newMineral[0] / 25
                let numOfIrons = (newMineral[0] - numOfDias * 25) / 5
                let numOfStones = newMineral[0] - numOfDias * 25 - numOfIrons * 5
                
                switch newPicks[mineralIdx] {
                case 0: fatigue += numOfDias + numOfIrons + numOfStones
                case 1: fatigue += numOfDias * 5 + numOfIrons + numOfStones
                case 2: fatigue += numOfDias * 25 + numOfIrons * 5 + numOfStones
                default: break
                }
            }
        }
        
        var lastMineralIdx = newMinerals.count - 1
        let pick = newPicks[lastMineralIdx]
        
        if newMinerals[lastMineralIdx][1] == 1 {
            if newMinerals[lastMineralIdx][0] == 5 || newMinerals[lastMineralIdx][0] == 25 {
                switch pick {
                case 0: fatigue += 1
                case 1: fatigue += newMinerals[lastMineralIdx][0] == 5 ? 1 : 5
                case 2: fatigue += newMinerals[lastMineralIdx][0]
                default: break
                }
                return fatigue
            }
        }
        
        let numOfDias = newMinerals[lastMineralIdx][0] / 25
        let numOfIrons = (newMinerals[lastMineralIdx][0] - numOfDias * 25) / 5
        let numOfStones = newMinerals[lastMineralIdx][0] - numOfDias * 25 - numOfIrons * 5
        
        switch pick {
        case 0: fatigue += numOfDias + numOfIrons + numOfStones
        case 1: fatigue += numOfDias * 5 + numOfIrons + numOfStones
        case 2: fatigue += numOfDias * 25 + numOfIrons * 5 + numOfStones
        default: break
        }
            return fatigue
        
    }
    
    
    
    
    
    
    
    
//    func solution2(_ picks:[Int], _ minerals:[String]) -> Int {
//        var maps: [(Int, Int)] = [] // (총 피로도, 광물의 갯수
//        var picks = picks
//        var answer = 0
//
//        func counting() {
//            var temp = 0
//            var count = 0
//
//            for mineral in minerals {
//                switch mineral {
//                case "diamond":
//                    temp += 25
//                case "iron":
//                    temp += 5
//                case "stone":
//                    temp += 1
//                default:
//                    break
//                }
//
//                count += 1
//                if count % 5 == 0 {
//                    maps.append((temp, 5))
//                    temp = 0
//                }
//            }
//            if count % 5 != 0 {
//                maps.append((temp, count % 5))
//            }
//        }
//
//        counting()
//
//        let maxDig = picks.reduce(0, +)
//
//        while maxDig < maps.count {
//            maps.removeLast()
//        }
//
//        for (map, count) in maps.sorted(by: >) {
//            if picks[0] != 0 {
//                answer += count
//                picks[0] -= 1
//            } else if picks[1] != 0 {
//                if map == 5 || map == 25 {
//                    answer += count
//                } else {
//                    answer += (count - (map / 25)) + ((map / 25) * 5)
//                }
//                picks[1] -= 1
//            } else {
//                answer += map
//            }
//        }
//
//        return answer
//    }
}
