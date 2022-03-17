//
//  SuccessViewModelTests.swift
//  ExchangeAppTests
//
//  Created by Enis Terzioglu on 16.03.2022.
//

import XCTest

class SuccessViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testData() throws {
        let data = SuccessData(amount: "0", finalAmount: "3", baseCurrency: "USD", targetCurrency: "EUR")
        let vm = SuccessViewModel(data: data)

        XCTAssertEqual(vm.data.amount, data.amount)
        XCTAssertEqual(vm.data.finalAmount, data.finalAmount)
        XCTAssertEqual(vm.data.baseCurrency, data.baseCurrency)
        XCTAssertEqual(vm.data.targetCurrency, data.targetCurrency)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
