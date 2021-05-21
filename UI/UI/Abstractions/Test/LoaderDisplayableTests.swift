//
//  LoaderDisplayableTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI
@testable import Presentation

class LoaderDisplayableTests: XCTestCase {
    //MARK: - Properties
    var testView = TestView()
    var testViewController = TestViewController()
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testView = TestView()
        testViewController = TestViewController()
    }
    
    
    //MARK: - Test functions
    func test_GivenLoaderDisplayableView_ThenAssertShow() {
        testView.showLoadingIndicator(over: testView, isSofter: true)
        assertShow(view: testView, loadingIndicator: testView.loadingIndicator)
    }
    
    func test_GivenLoaderDisplayableView_ThenAssertDismiss() {
        testView.showLoadingIndicator(over: testView, isSofter: true)
        testView.dismissLoadingIndicator()
        assertDismiss(loadingIndicator: testView.loadingIndicator)
    }
    
    func test_GivenLoaderDisplayableView_AndProcessingDisplayableViewController_ThenAssertShow() {
        testViewController.processingDisplayable(isProcessing: true)
        assertShow(view: testViewController.view, loadingIndicator: testViewController.loadingIndicator)
    }
    
    func test_GivenLoaderDisplayableView_AndProcessingDisplayableViewController_ThenAssertDismiss() {
        testViewController.processingDisplayable(isProcessing: true)
        testViewController.processingDisplayable(isProcessing: false)
        assertDismiss(loadingIndicator: testViewController.loadingIndicator)
    }
    
    
    //MARK: - Helpers
    func assertShow(view: UIView, loadingIndicator: UIActivityIndicatorView) {
        expect(description: "Testing LoadingIndicator Show", completion: { expectation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                XCTAssertFalse(loadingIndicator.isHidden)
                XCTAssertTrue(loadingIndicator.isAnimating)
                XCTAssertEqual(loadingIndicator.superview, view)
                expectation.fulfill()
            }
        })
    }
    
    func assertDismiss(loadingIndicator: UIActivityIndicatorView) {
        expect(description: "Testing LoadingIndicator Dismiss", completion: { expectation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                XCTAssertTrue(loadingIndicator.isHidden)
                XCTAssertFalse(loadingIndicator.isAnimating)
                XCTAssertNil(loadingIndicator.superview)
                expectation.fulfill()
            }
        })
    }
}
