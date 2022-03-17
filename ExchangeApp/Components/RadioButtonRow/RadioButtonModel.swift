//
//  RadioButtonModel.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 16.03.2022.
//

import Foundation

protocol RadioButtonModelProtocol {
    var text: String { get set }
    var isSelected: Bool { get set }
    var id: UUID { get set }
}

class RadioButtonModel: RadioButtonModelProtocol, Identifiable {
    public init(text: String, isSelected: Bool, id: UUID = UUID()) {
        self.text = text
        self.isSelected = isSelected
        self.id = id
    }

    var text: String
    var isSelected: Bool
    var id: UUID = UUID()
}
