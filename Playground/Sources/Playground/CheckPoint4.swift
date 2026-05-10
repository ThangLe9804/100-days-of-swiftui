//
//  CheckPoint4.swift
//  Playground
//
//  Created by Thang Le on 10/5/26.
//

enum SquareRootError: Error {
    case OutOfRange, NoRoot
}

func getSquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SquareRootError.OutOfRange
    }

    for i in 1 ... 100 {
        if i * i == number {
            return i
        }
    }

    throw SquareRootError.NoRoot
}
