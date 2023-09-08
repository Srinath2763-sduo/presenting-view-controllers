//
//  USBankInterviewTests.swift
//  USBankInterviewTests
//
//  Created by Srinath Shah on 9/2/23.
//

import XCTest
@testable import USBankInterview

final class ViewControllerTests: XCTestCase {
    
    var sut: ViewController!

    override func setUpWithError() throws {
        sut = UIStoryboard(
            name: "Main",
            bundle: Bundle.main )
        .instantiateViewController(withIdentifier: "ViewController") as? ViewController
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testTitleIsSet() throws {
      
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
