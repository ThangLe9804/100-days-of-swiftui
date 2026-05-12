//
//  CheckPoint5.swift
//  Playground
//
//  Created by Thang Le on 12/5/26.
//

func filterThenSortThenMap(_ luckyNumber: [Int]) -> [String] {
    return luckyNumber.filter { $0 % 2 == 1 }.sorted().map { "\($0) is a lucky number" }
}
