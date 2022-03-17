//
//  NetworkError.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation

enum NetworkError: Error, LocalizedError {

    case serverError(code:Int, error: String, stringCode: String?)
    case invalidJson(_ message: Error)
    case invalidUrl(_ url: String)
    case invalidBody(_ url: String, error: Error)

    var errorCode: Int {
        switch self {
        case .serverError(let code, _, _):
            return code
        case .invalidJson(_):
            return 2001
        case .invalidUrl(_):
            return 2002
        case .invalidBody(_, error: _):
            return 2003
        }
    }


    var errorDescription: String? {
        switch self {
        case .serverError(_, let error, _):
            return error
        case .invalidJson:
            return "Invalid JsonParser"
        case .invalidUrl:
            return "Invalid URL"
        case .invalidBody(_, let error):
            return "Invalid Body \(error)"
        }
    }

    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        lhs.errorCode == rhs.errorCode
    }
}
