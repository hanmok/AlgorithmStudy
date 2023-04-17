//
//  TwoCircles.swift
//  AlgorithmStudy
//
//  Created by Mac mini on 2023/04/14.
//

import Foundation

struct TwoCircles {
    func say() -> String {
        return "hi"
    }
    
    func solution(_ r1:Int, _ r2:Int) -> Int64 {
        guard r1 != r2 else { return 4 }
        var ans: Int64 = 0
    
        var r1 = Int64(r1)
        var r2 = Int64(r2)
        
        var prevMinX = getMinX(r1, 1, startsFrom: r1)
        var prevMaxX = getMaxX(r2, 1, startsFrom: r2)
        
        for y in 1 ... r2 {
            let minX = getMinX(r1, y, startsFrom: prevMinX)
            let maxX = getMaxX(r2, y, startsFrom: prevMaxX)
            prevMinX = minX
            prevMaxX = maxX
            
            ans += maxX - minX + 1
        }
            
        return ans * 4
    }
    
    func square(_ x: Int64) -> Int64 {
        return x * x
    }
    
    func getMinX(_ r1: Int64, _ y: Int64, startsFrom X: Int64) -> Int64 {
        var x = X
        let squareY = square(y)
        let squareR = square(r1)
        while square(x) + squareY >= squareR && x >= 0 {
            x -= 1
        }
        return Int64(x + 1)
    }
    
    func getMaxX(_ r2: Int64, _ y: Int64, startsFrom X: Int64) -> Int64 {
        var x = X
        let squareY = square(y)
        let squareR = square(r2)
        while square(x) + squareY > squareR && x >= 1 {
            x -= 1
        }
        return Int64(x)
    }
    
    
    
    
    
    func slowSolution(_ r1:Int, _ r2:Int) -> Int64 {
            guard r1 != r2 else { return 4 }
            let dotsOnAxis: Int64 = Int64((r2 - r1 + 1) * 4)
            // TODO: 1사분면 내에 있는 모든 점의 갯수 구하고 * 4 해서 Return
            var ans: Int64 = 0
            // x >= 1 && y >= 1
        xloop: for x in 1 ... r2 {
            yloop: for y in 1 ... r2 {
                    if isBetweenCircle(x, y, r1, r2) {
                        ans += 1
                    } else if isInsideCircle(x, y, r1) == false {
                        break yloop
                    }
                }
            }
                
            return ans * 4 + dotsOnAxis
        }
        
        func isBetweenCircle(_ x: Int, _ y: Int, _ r1: Int, _ r2: Int) -> Bool {
            let middle = square(x) + square(y)
            let smallSquare = square(r1)
            let bigSquare = square(r2)
            
            return smallSquare <= middle && middle <= bigSquare
        }
        
        func isInsideCircle(_ x: Int, _ y: Int, _ r: Int) -> Bool {
            let middle = square(x) + square(y)
            let circle = square(r)
            return circle >= middle
        }
        
        func square(_ x: Int) -> Int {
            return x * x
        }
    
    
}
