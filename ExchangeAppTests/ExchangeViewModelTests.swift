//
//  ExchangeViewModelTests.swift
//  ExchangeAppTests
//
//  Created by Enis Terzioglu on 16.03.2022.
//

import XCTest
@testable import ExchangeApp

class ExchangeViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReverseCurrecySelection() throws {
        let vm = ExchangeViewModel()
        vm.baseCurrency = "USD"
        vm.targetCurrency = "EUR"
        vm.reverseCurrecySelection()

        XCTAssertEqual(vm.baseCurrency, "EUR")
        XCTAssertEqual(vm.targetCurrency, "USD")
    }

    func testCalculateFinalAmount() throws {
        let vm = ExchangeViewModel()
        vm.amount = "100"
        vm.conversionRate = 1.5
        let amountInt = Float(vm.amount) ?? 0
        vm.finalAmount = String(format: "%.2f", (amountInt * vm.conversionRate))
        XCTAssertEqual(vm.finalAmount, "150.00")

    }

    func testSetCurrencyRate() throws {
        let vm = ExchangeViewModel()
        vm.baseCurrency = "USD"
        vm.targetCurrency = "EUR"
        vm.conversionRate = 1.5
        vm.currencyRate = "1 \(vm.baseCurrency) = \(vm.conversionRate) \(vm.targetCurrency)"
        XCTAssertEqual(vm.currencyRate, "1 USD = 1.5 EUR")
    }

    func testGetConfirmMessage() throws {
        let vm = ExchangeViewModel()
        vm.baseCurrency = "USD"
        vm.targetCurrency = "EUR"
        vm.amount = "100"
        vm.conversionRate = 1.5
        vm.calculateFinalAmount()
        let message = vm.getConfirmMessage()

        XCTAssertEqual(message, "Are you about to get \(vm.amount) \(vm.baseCurrency) for \(vm.finalAmount) \(vm.targetCurrency)? Do you approve the transaction?")
    }

    func testGetSuccessData() throws {
        let vm = ExchangeViewModel()
        vm.baseCurrency = "USD"
        vm.targetCurrency = "EUR"
        vm.amount = "100"
        vm.conversionRate = 1.5
        vm.calculateFinalAmount()
        let data = SuccessData(amount: "100", finalAmount: "150.00", baseCurrency: "USD", targetCurrency: "EUR")
        let vmData = vm.getSuccessData()

        XCTAssertEqual(data.amount, vmData.amount)
        XCTAssertEqual(data.finalAmount, vmData.finalAmount)
        XCTAssertEqual(data.baseCurrency, vmData.baseCurrency)
        XCTAssertEqual(data.targetCurrency, vmData.targetCurrency)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
