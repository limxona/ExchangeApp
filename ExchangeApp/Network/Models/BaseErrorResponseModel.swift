//
//  BaseErrorResponseModel.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation

public struct BaseErrorResponseModel: Codable {
    let result: String
    let errorType: String

    private enum CodingKeys : String, CodingKey {
        case result
        case errorType = "error-type"
    }

}
