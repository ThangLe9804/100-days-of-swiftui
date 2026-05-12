//
//  CheckPoint5Tests.swift
//  Playground
//
//  Created by Thang Le on 12/5/26.
//

@testable import Playground
import Testing

struct CheckPoint5Tests {
    @Test(arguments: [
        (
            [7, 4, 38, 21, 16, 15, 12, 33, 31, 49],
            ["7 is a lucky number", "15 is a lucky number", "21 is a lucky number",
             "31 is a lucky number", "33 is a lucky number", "49 is a lucky number"]
        ),
        (
            [2, 4, 6],
            []
        ),
        (
            [3, 1],
            ["1 is a lucky number", "3 is a lucky number"]
        )
    ])
    func filterThenSortThenMapTest(input: [Int], expected: [String]) {
        #expect(filterThenSortThenMap(input) == expected)
    }
}
