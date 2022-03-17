//
//  ApiConstants.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation

struct ApiConstants {

    static var baseUrl: String {
        return "https://v6.exchangerate-api.com/v6/"
    }

    static var appKey: String {
        return "0c2ca629edc1d87cf4b63f7b"
    }
}

struct Endpoints {
    static let supportedCodes = ApiConstants.baseUrl + "/codes"
    static let getConversionRate = ApiConstants.baseUrl + "/pair"

}
