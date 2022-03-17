//
//  Publisher+extension.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 13.03.2022.
//

import Combine

extension Publisher {

    func sinkHandler(_ result: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
        return sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                result(.failure(error))
            default: break
            }
        }, receiveValue: { value in
            result(.success(value))
        })
    }
    
}
