//
//  SuccessViewModel.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 15.03.2022.
//

import Foundation

final class SuccessViewModel: ObservableObject {

    @Published var data: SuccessData

    init(data: SuccessData) {
        self.data = data
    }


}
