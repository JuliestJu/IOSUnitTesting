//
//  VievControllerTests.swift
//  NaviagationTests
//
//  Created by Юлия Воротченко on 19.03.2021.
//  Copyright © 2021 Юлия Воротченко. All rights reserved.
//
@testable import Naviagation
import XCTest

class VievControllerTests: XCTestCase {
    
    private var storyboard = UIStoryboard(name: "Main", bundle: nil)
    private var sut: ViewController! = nil
    private var navigation: UINavigationController! = nil
    
    override func setUp() {
        super.setUp()
        self.sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        self.navigation = UINavigationController(rootViewController: sut)
        self.sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        self.sut = nil
        self.navigation = nil
        super.tearDown()
    }
    
    func test_IfButtonsAreConnected() {
        let codePushButton: UIButton = self.sut.codePushButton
        let codeModalButton: UIButton = self.sut.codeModalButton
        let seguePushButton: UIButton = self.sut.seguePushButton
        let segueModalButton: UIButton = self.sut.segueModalButton
      
        XCTAssertNotNil(codePushButton, "View Controller does not have codePushButton property")
        XCTAssertNotNil(codeModalButton, "View Controller does not have codeModalButton property")
        XCTAssertNotNil(seguePushButton, "View Controller does not have seguePushButton property")
        XCTAssertNotNil(segueModalButton, "View Controller does not have segueModalButton property")
        
    }
    
    func test_IfLoginButtonsHasActionAssigned() {
        
        let codePushButton: UIButton = self.sut.codePushButton
        let codeModalButton: UIButton = self.sut.codeModalButton
       
        
        guard let codePushButtonActions = codePushButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("codePushButtonActions does not have actions assigned for Control Event .touchUpInside")
            return}
        
        guard let codeModalButtonActions = codeModalButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("codeModalButtonActions does not have actions assigned for Control Event .touchUpInside")
            return
        }
        
    }
    
    func test_ViewControllerHas_NavigationController() {
        XCTAssertNotNil(sut.navigationController)
    }
    
    func test_NavigationHas_2Controllers() {
        tap(self.sut.codePushButton)
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
    }
    
    func test_IfPushedControllerIsTheOne() {
        tap(self.sut.codePushButton)
        let pushedVC = navigation.viewControllers.last
        executeRunLoop()
        XCTAssertTrue(pushedVC is CodeNextViewController, "Expected CodeNextViewController" + "but was \(String(describing: pushedVC))")
        
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        tap(self.sut.codePushButton)
        executeRunLoop()
        let pushedVC = navigation.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController" + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed from code")
    }
    
}
