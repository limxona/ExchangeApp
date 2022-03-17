//
//  NetworkDefaults.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import SwiftUI

class NetworkDefaults: NSObject, URLSessionDelegate {

    func configuration() -> URLSession {

        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 10
        configuration.urlCache = .shared
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }

    static func headers() -> [HTTPHeader] {
        var headers = [HTTPHeader]()
        headers.append(HTTPHeader(name: "Authorization", value: "Bearer \(ApiConstants.appKey)"))
        //headers.append(HTTPHeader(name: "Content-Type", value: "application/json; charset=utf-8"))
        return headers
    }

}

