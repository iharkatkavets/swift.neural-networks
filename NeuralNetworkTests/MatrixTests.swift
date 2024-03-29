//
//  MatrixTests.swift
//  NeuralNetworkTests
//
//  Created by igork on 6/8/19.
//  Copyright © 2019 Igor Kotkovets. All rights reserved.
//

import XCTest

class MatrixTests: XCTestCase {

    func testThatCreateIntMatrix() {
        var matrix = Matrix<Int>(rows: 10, columns: 10, defaultValue: 0)
        matrix[0,0] = 1
        XCTAssertEqual(matrix[0,0], 1)
        matrix[1,1] = 2
        XCTAssertEqual(matrix[1,1], 2)
    }

    func testThatCreateDoubleMatrix() {
        var dblMatrix = Matrix(rows: 5, columns: 5, random: (1, 1))
        
    }

    func testThatIterateIntMatrix() {
        var matrix = Matrix<Int>(rows: 3, columns: 3, defaultValue: 5)
        var count = 0
        for element in matrix {
            count += 1
        }

        XCTAssertEqual(count, 9)
    }

    func testThatMultMatrix() {
        var matrix = Matrix<Double>(rows: 3, columns: 3, defaultValue: 3)
        let matrix9 = 3 * matrix
        XCTAssertEqual(matrix9[0,0], 9.0)
    }

    func testThatSigmoidMatrix() {
        var matrix = Matrix<Double>(rows: 2, columns: 2, defaultValue: 3)
        print(matrix)
        let matrix9 = sigmoid(matrix)
        print(matrix9)
    }

    func testThatMultiplyMatrixes() {
        let firstArray = [1.0, 2.0, 3.0, 4.0]
        let first = Matrix(rows: 2, columns: 2, array: firstArray)

        let secondArray = [5.0, 6.0, 7.0, 8.0]
        let second = Matrix(rows: 2, columns: 2, array: secondArray)

        let result = try! first.dot(second)
        XCTAssertEqual(19, result[0,0])
        XCTAssertEqual(22, result[0,1])
        XCTAssertEqual(43, result[1,0])
        XCTAssertEqual(50, result[1,1])
    }

    func testThatMultiplyMatrixAndVertor() {
        let firstArray = [1.0, 2.0, 3.0, 4.0]
        let matrix = Matrix(rows: 2, columns: 2, array: firstArray)

        let vectorArray = [5.0, 6.0];
        let vector = Matrix(rows: 2, columns: 1, array: vectorArray)

        let result = try! matrix.dot(vector)
        XCTAssertEqual(17, result[0,0])
        XCTAssertEqual(39, result[0,1])
    }

    func testThatTransformMatrix() {
        let array = [1.0, 2.0, 3.0, 4.0]
        let matrix = Matrix(rows: 1, columns: 4, array: array)
        let transformed = matrix.T
        XCTAssertEqual(1.0, transformed[0,0])
        XCTAssertEqual(2.0, transformed[1,0])
        XCTAssertEqual(3.0, transformed[2,0])
        XCTAssertEqual(4.0, transformed[3,0])
    }

    func testMatrixSubstraction() {
        let firstMatrix = Matrix(rows: 2, columns: 2, elements: 1.0, 1.0, 1.0, 1.0)
        let secondMatrix = Matrix(rows: 2, columns: 2, elements: 0.1, 0.2, 0.3, 0.4)
        let sub = firstMatrix - secondMatrix
        XCTAssertEqual(0.9, sub[0,0])
        XCTAssertEqual(0.8, sub[0,1])
        XCTAssertEqual(0.7, sub[1,0])
        XCTAssertEqual(0.6, sub[1,1])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            let W = Matrix(rows: 1000,columns: 1000, valuesInRange: 0.1...0.9)
            let I = Matrix(rows: 1000, columns: 1000, valuesInRange: 0.1...0.9)
            let O = try? W.dot(I)
        }
    }

}
