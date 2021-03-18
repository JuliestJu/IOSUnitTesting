//
//  OutletConnectionsViewController.swift
//  OutletConnectionsTests
//
//  Created by Юлия Воротченко on 18.03.2021.
//
@testable  import OutletConnections
import XCTest

class OutletConnectionsViewControllerTest: XCTestCase {

    func test_outlets_ShouldBeConnected() {
        let sut = OutletConnectionsViewController.init()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label, "label")
        XCTAssertNotNil(sut.button, "button")
        
    }
  

}
