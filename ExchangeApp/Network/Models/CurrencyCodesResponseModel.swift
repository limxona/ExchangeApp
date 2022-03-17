//
//  CurrencyCodesResponseModel.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation

public struct CurrencyCodesResponseModel: Codable {
    let result: String
    let codes: [[String]]

    private enum CodingKeys : String, CodingKey {
            case result
            case codes = "supported_codes"
        }
}
