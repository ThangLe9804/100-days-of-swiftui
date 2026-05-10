//
//  CheckPoint4Tests.swift
//  Playground
//
//  Created by Thang Le on 10/5/26.
//

@testable import Playground
import Testing

struct CheckPoint4Tests {
    // MARK: - Valid inputs

    @Test(arguments: [
        (1, 1),
        (4, 2),
        (9, 3),
        (100, 10),
        (10000, 100)
    ])
    func perfectSquare(input: Int, expected: Int) throws {
        #expect(try getSquareRoot(of: input) == expected)
    }

    // MARK: - Out of range

    @Test(arguments: [0, -1, 10001])
    func outOfRange(input: Int) {
        #expect(throws: SquareRootError.OutOfRange) {
            try getSquareRoot(of: input)
        }
    }

    // MARK: - No root

    @Test(arguments: [2, 99, 9999])
    func noRoot(input: Int) {
        #expect(throws: SquareRootError.NoRoot) {
            try getSquareRoot(of: input)
        }
    }
}
