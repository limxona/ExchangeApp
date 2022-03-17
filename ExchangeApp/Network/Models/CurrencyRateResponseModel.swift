//
//  CurrencyRateResponseModel.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation

public struct CurrencyRateResponseModel: Codable {
    let result: String
    let baseCode: String
    let targetCode: String
    let conversionRate: Float

    private enum CodingKeys : String, CodingKey {
        case result
        case baseCode = "base_code"
        case targetCode = "target_code"
        case conversionRate = "conversion_rate"
    }
}
