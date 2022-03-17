//
//  BorderedText.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct BorderedText: View {
    private var text: String
    private var color: Color

    init(_ text: String, color: Color = Color.appMediumGray) {
        self.text = text
        self.color = color
    }
    var body: some View {
        Text(text)
            .font(.footnote)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .foregroundColor(color)
            .overlay(
                Capsule()
                    .stroke(color, lineWidth:1)
            )
    }
}

struct BorderedText_Previews: PreviewProvider {
    static var previews: some View {
        BorderedText("test")
    }
}
