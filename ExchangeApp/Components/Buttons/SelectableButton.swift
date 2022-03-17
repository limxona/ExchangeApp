//
//  SelectableButton.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct SelectableButton: View {
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
                .foregroundColor(Color.appBlack)
                .font(.callout)
                .fontWeight(.semibold)
            Image(systemName: "chevron.down")
                .font(.footnote)
                .foregroundColor(Color.appBlack)
        }
        .frame(height: 36)
        .padding(.leading, 24)
        .padding(.trailing, 12)
        .background(Color.appLightGray)
        .cornerRadius(18)
    }
}

struct SelectableButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectableButton("USD") { }
    }
}
