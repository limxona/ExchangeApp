//
//  RadioButton.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct RadioButton: View {

    var isActive: Binding<Bool> = .constant(false)

    var body: some View {
        Image(systemName:  isActive.wrappedValue ? "checkmark.circle.fill" : "circle.fill")
            .font(.system(size: 32))
            .foregroundColor(isActive.wrappedValue ? Color.appBlue : Color.appRegularGray)
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton()
    }
}
