//
//  CoveredClassTests.swift
//  CodeCoverageTests
//
//  Created by Юлия Воротченко on 16.03.2021.
//
@testable import CodeCoverage
import XCTest


class CoveredClassTests: XCTestCase {
     
    func test_max_with1and2_shouldReturn2() {
        let result = CoveredClass.max(1, 2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_max_with3and2_shouldReturn3() {
        let result = CoveredClass.max(3, 2)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_commaSeparated_from2to4_shouldReturn234SeparatedByCommas() {
        let result = CoveredClass.commaSeparated(from: 2, to: 4)
        
        XCTAssertEqual(result, "2,3,4")
    }
    
    func test_commaSeparated_from2to2_shouldReturn2WithNoComma() {
        let result = CoveredClass.commaSeparated(from: 2, to: 2)
        
        XCTAssertEqual(result, "2")
    }
    
    func test_area_widthWidth7_shouldBeSomething() {
        let sut = CoveredClass()
        
        sut.width = 7
        
        XCTAssertEqual(sut.area, 49)
    }
    
    func test_area_widthWidth6_shouldBeSomething() {
        let sut = CoveredClass()
        
        sut.width = 6
        
        XCTAssertEqual(sut.area, 36)
    }

}
