//
//  PrimaryButton.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct PrimaryButton: View {
    var tap: (() -> Void)
    var title: String

    init(_ title: String, _ tap: @escaping (() -> Void)) {
        self.title = title
        self.tap = tap
    }

    var body: some View {
        Button {
            tap()
        } label: {
            Text(title)
                .foregroundColor(Color.white)
                .font(.callout)
                .fontWeight(.semibold)
        }
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .background(Color.appBlue)
        .cornerRadius(8)
        .padding(16)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton("Test") { }
    }
}
