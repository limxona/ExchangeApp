//
//  ExchangeServices.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation
import Combine

protocol ExchangeServiceProtocol {
    func getSupportedCodes() -> AnyPublisher<CurrencyCodesResponseModel, Error>
    func getConversionRate(baseCode: String, targetCode: String) -> AnyPublisher<CurrencyRateResponseModel, Error>
}

public class ExchangeServices: ExchangeServiceProtocol {

    let network = Network()

    public func getSupportedCodes() -> AnyPublisher<CurrencyCodesResponseModel, Error> {
        let url = Endpoints.supportedCodes
        return network.get(url: url)
    }

    func getConversionRate(baseCode: String, targetCode: String) -> AnyPublisher<CurrencyRateResponseModel, Error> {
        let url = Endpoints.getConversionRate + "/\(baseCode)/\(targetCode)"
        return network.get(url: url)
    }

}
