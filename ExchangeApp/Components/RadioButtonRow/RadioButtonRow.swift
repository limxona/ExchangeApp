//
//  RadioButtonRow.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct RadioButtonRow: View {
    @Binding var data: RadioButtonModelProtocol

    var body: some View {
        HStack(spacing: 0) {
            Text(data.text)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.appGray)
            Spacer()
            RadioButton(isActive: $data.isSelected)
        }
    }
}

struct RadioButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonRow(data: .constant(RadioButtonModel(text: "test", isSelected: false)))
    }
}
