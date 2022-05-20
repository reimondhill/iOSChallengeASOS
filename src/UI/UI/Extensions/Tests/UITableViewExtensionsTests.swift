//
//  UIDeviceExtensionsTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI

class UITableViewExtensionsTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    
    //MARK: - Test functions
    func test_GivenTableView_ThenAssertRegisterAndDequeueCells() {
        let tableView = UITableView()
        tableView.registerEmptyCell()
        tableView.register(TestTableViewCell.self)
        
        //Making Sure it's not crashing
        _ = tableView.dequeueEmptyCell(forIndexPath: IndexPath(row: 0, section: 0))
        
        let _: TestTableViewCell = tableView.dequeueReusableCell(forIndexPath: IndexPath(row: 0, section: 1))
    }
}
