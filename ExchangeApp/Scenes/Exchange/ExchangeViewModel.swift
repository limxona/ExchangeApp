//
//  ExchangeViewModel.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation

final class ExchangeViewModel: ObservableObject {

    private var cancelBag = CancelBag()
    private var exchangeService = ExchangeServices()
    private var currencyPickerTypeSelection: CurrencyPickerType = .base

    var conversionRate: Float = 0
    @Published var amount = "100" {
        didSet {
            if amount.isEmpty {
                amount = "0"
            }
            calculateFinalAmount()
        }
    }
    @Published var finalAmount: String = ""
    @Published var baseCurrency: String {
        didSet {
            UserDefaults.standard.set(baseCurrency, forKey: "baseCurrency")
        }
    }
    @Published var targetCurrency: String {
        didSet {
            UserDefaults.standard.set(targetCurrency, forKey: "targetCurrency")
        }
    }
    @Published var currencyRate: String = ""
    @Published var selectedCurrency: RadioButtonModel? = nil
    @Published var currencyList: [RadioButtonModel] = [RadioButtonModel(text: "USD", isSelected: false),
                                                       RadioButtonModel(text: "EUR", isSelected: false),
                                                       RadioButtonModel(text: "TRY", isSelected: false),
                                                       RadioButtonModel(text: "GBP", isSelected: false),
                                                       RadioButtonModel(text: "CAD", isSelected: false),
                                                       RadioButtonModel(text: "JPY", isSelected: false)]


    init() {
        baseCurrency = UserDefaults.standard.object(forKey: "baseCurrency") as? String ?? "USD"
        targetCurrency = UserDefaults.standard.object(forKey: "targetCurrency") as? String ?? "EUR"
    }

    public func calculateFinalAmount() {
        let amountInt = Float(amount) ?? 0
        finalAmount = String(format: "%.2f", (amountInt * conversionRate))
    }

    private func setCurrencyRate() {
        currencyRate = "1 \(self.baseCurrency) = \(conversionRate) \(self.targetCurrency)"
    }

    public func setNewSelection() {
        if currencyPickerTypeSelection == .base {
            baseCurrency = selectedCurrency?.text ?? ""
        } else {
            targetCurrency = selectedCurrency?.text ?? ""
        }

        getConversionRate()
    }

    public func reverseCurrecySelection() {
        let tmpBaseCurrency = baseCurrency
        let tmpTargetCurreny = targetCurrency
        baseCurrency = tmpTargetCurreny
        targetCurrency = tmpBaseCurrency
        getConversionRate()
    }

    public func currencyPickerSelection(type: CurrencyPickerType) {
        currencyPickerTypeSelection = type
        let selectedPickerText = type == .base ? baseCurrency : targetCurrency
        selectedCurrency = RadioButtonModel(text: selectedPickerText, isSelected: true)
        currencyList.forEach {  $0.isSelected = ($0.text == selectedPickerText) }
    }

    public func getConfirmMessage() -> String {
        return "Are you about to get \(amount) \(baseCurrency) for \(finalAmount) \(targetCurrency)? Do you approve the transaction?"
    }

    public func getSuccessData() -> SuccessData {
        return SuccessData(amount: amount,
                           finalAmount: finalAmount,
                           baseCurrency: baseCurrency,
                           targetCurrency: targetCurrency)
    }

}

// MARK: - Service Requests -
extension ExchangeViewModel {
    public func getConversionRate() {
        exchangeService.getConversionRate(baseCode: baseCurrency, targetCode: targetCurrency).sinkHandler { result in
            switch result {
            case .failure(_):
                break
            case .success(let response):
                self.conversionRate = response.conversionRate
                self.setCurrencyRate()
                self.calculateFinalAmount()
            }
        }.store(in: cancelBag)
    }
}
