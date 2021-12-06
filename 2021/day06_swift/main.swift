//
//  main.swift
//  day06_swift
//
//  Created by Roman Peters on 06/12/2021.
//

import Foundation

let filePath = URL(fileURLWithPath: "input.txt")
let inputFile: String = try! String(contentsOf: filePath, encoding: .utf8)
var lanternfish: [Int] = []
for fish in inputFile.split(separator: ",") {
    lanternfish.append(Int(fish.trimmingCharacters(in: .whitespacesAndNewlines))!)
}

func timeTravelFor(days: Int) {
    for _ in 1...days {
        for n in lanternfish.indices {
            lanternfish[n] -= 1
            if lanternfish[n] < 0 {
                lanternfish[n] = 6
                lanternfish.append(8)
            }
        }
    }
}

timeTravelFor(days: 80)

print("Solution part 1: \(lanternfish.count)")

// part 2


var lanternfish_2: [Int] = []
for fish in inputFile.split(separator: ",") {
    lanternfish_2.append(Int(fish.trimmingCharacters(in: .whitespacesAndNewlines))!)
}

func getFishCountAfter(days: Int, fishes: [Int]) -> Int {
    var fishCount: [Int:Int] = [:]  // [fish: count]
    var fishCountTemp: [Int:Int]
    var result: Int = 0
    
    for fish in Set(fishes) {
        fishCount[fish] = fishes.filter{$0 == fish}.count
    }
    for _ in 1...days {
        fishCountTemp = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0]
        for (f, n) in fishCount {
            if f == 0 {
                fishCountTemp[6]! += n
                fishCountTemp[8]! += n
            } else {
                fishCountTemp[f-1]! += n
            }
        }
        fishCount = fishCountTemp
    }
    for (_, n) in fishCount {
        result += n
    }
    return result
    
}

let result: Int = getFishCountAfter(days: 256, fishes: lanternfish_2)
print("Solution part 2: \(result)")

