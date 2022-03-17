//
//  AmountView.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct AmountView: View {

    private var amount: Binding<String>
    private var finalAmount: Binding<String>

    init(amount: Binding<String>, finalAmount: Binding<String>) {
        self.amount = amount
        self.finalAmount = finalAmount
    }
    

    var body: some View {
        VStack(spacing: 8) {
            TextField("", text: amount)
                .font(Font.largeTitle.weight(.bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.appBlue)
                .keyboardType(.numberPad)

            Color.gray.opacity(0.4).frame(width: 32, height: 1)

            (Text("Final Amount: ")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color.appMediumGray)
             + Text(finalAmount.wrappedValue))
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(Color.appMediumBlack)
                .padding(.top, 8)
        }
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(amount: .constant("120"), finalAmount: .constant("€ 102.4"))
    }
}
