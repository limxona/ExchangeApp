//
//  ApiManager.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Foundation
import Combine

protocol ExecuterProtocol {
    func execute<T: Codable>(_ urlRequest: URLRequest) -> AnyPublisher<T, Error>
}


class ApiManager: ExecuterProtocol {

    let session: URLSession

    public init(_ session: URLSession = NetworkDefaults().configuration()) {
        self.session = session
    }

    func execute<T: Codable>(_ urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {

                    if response.statusCode == 401 {
                        throw NetworkError.serverError(code: 0, error: "Unauthorized Error", stringCode: "")
                    }else if response.statusCode == 500 {
                        throw NetworkError.serverError(code: 500, error: "Internal Server Error", stringCode: nil)
                    }else {
                        let baseError = try JSONDecoder().decode(BaseErrorResponseModel.self, from: data)
                        throw NetworkError.serverError(code: 0, error: "\(baseError.result)-\(baseError.errorType)", stringCode: "")
                    }
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
