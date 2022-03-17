//
//  RoundedButton.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct RoundedButton: View {
    var tap: (() -> Void)
    var imageName: String

    init(_ imageName: String, _ tap: @escaping (() -> Void)) {
        self.imageName = imageName
        self.tap = tap
    }

    var body: some View {
        Button {
            tap()
        } label: {
            Image(systemName: imageName)
                .frame(width: 36, height: 36)
                .font(Font.callout.weight(.semibold))
                .foregroundColor(Color.appBlue)
                .cornerRadius(36)
                .overlay(
                    Circle()
                        .stroke(Color.appRegularGray, lineWidth:1)
                )
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton("arrow.left.arrow.right") { }
    }
}
