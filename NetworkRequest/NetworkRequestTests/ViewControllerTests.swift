//
//  ViewControllerTests.swift
//  NetworkRequestTests
//
//  Created by Юлия Воротченко on 19.03.2021.
//  Copyright © 2021 Юлия Воротченко. All rights reserved.
//

import XCTest
@testable import NetworkRequest

class ViewControllerTests: XCTestCase {

    private var storyboard = UIStoryboard(name: "Main", bundle: nil)
    private var sut: ViewController! = nil
    private var session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        self.sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        self.sut.session = session
        self.sut.loadViewIfNeeded()
        
              
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    
    
    func test_tappingButtonShouldMakeDataTaskToSearchForEbookFromBoneWille() {
        tap(self.sut.button)
        session.verifyDataTask(with: URLRequest(url: URL(string: "https://itunes.apple.com/search?media=ebook&term=Out%20from%20bonewille")!))
    }
    
   

}
