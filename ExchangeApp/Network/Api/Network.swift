//
//  Network.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation
import Combine

public class Network {

    let executer: ExecuterProtocol

    init(_ executer: ExecuterProtocol = ApiManager()) {
        self.executer = executer
    }


    func post<T: Codable>(url: String,
                          headers: [HTTPHeader] = [],
                          parameters: T? = nil) -> AnyPublisher<T, Error> {

        guard let mURL = URL(string: url) else {
            return Fail(error: NetworkError.invalidUrl(url)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: mURL)
        request.httpMethod = HTTPMethod.POST.rawValue

        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.sortedKeys,.withoutEscapingSlashes]
            let jsonBody = try encoder.encode(parameters)
            request.httpBody = jsonBody
        } catch let error {
            return Fail(error: NetworkError.invalidBody(url, error: error)).eraseToAnyPublisher()
        }

        let allHeaders = headers + NetworkDefaults.headers()
        allHeaders.forEach { item in
            request.addValue(item.value, forHTTPHeaderField: item.name)
        }

        return executer.execute(request)
    }

    func get<T: Codable>(url: String,
                         headers: [HTTPHeader] = [],
                         parameters: [String: String] = [:]) -> AnyPublisher<T, Error> {
        var component = URLComponents(string: url)

        if !parameters.isEmpty {
            let quertyItems = parameters.map{ URLQueryItem(name: $0.key, value: $0.value) }
            component?.queryItems = quertyItems
        }

        guard let cUrl = component?.url, !cUrl.absoluteString.isEmpty else {
            return Fail(error: NetworkError.invalidUrl(component?.url?.absoluteString ?? "WRONG URL")).eraseToAnyPublisher()
        }

        if URL(string: cUrl.absoluteString) == nil {
            return Fail(error: NetworkError.invalidUrl(component?.url?.absoluteString ?? "WRONG URL")).eraseToAnyPublisher()
        }

        var request = URLRequest(url: component!.url!)
        request.httpMethod = HTTPMethod.GET.rawValue

        let allHeaders = headers + NetworkDefaults.headers()
        allHeaders.forEach { item in
            request.addValue(item.value, forHTTPHeaderField: item.name)
        }

        return executer.execute(request)

    }
}
