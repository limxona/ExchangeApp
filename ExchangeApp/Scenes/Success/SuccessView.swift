//
//  SuccessView.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject public var viewModel: SuccessViewModel

    var body: some View {
        NavigationView {
            content
        }.navigationBarBackButtonHidden(true)
    }

    var content: some View {
        VStack(spacing: 0) {
            Spacer()
            successContent
            Spacer()
            primaryButton
        }
    }

    var successContent: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 64))
                .foregroundColor(Color.appGreen)

            Text("Success")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.appBlack)

            (Text("\(viewModel.data.amount) \(viewModel.data.baseCurrency) = ")
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(Color.appMediumGray)
             + Text("\(viewModel.data.targetCurrency) \(viewModel.data.finalAmount)")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.appRegularGray)
            )

        }
    }

    var primaryButton: some View {
        PrimaryButton("Back to Exchange") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SuccessViewModel(data: SuccessData(amount: "", finalAmount: "", baseCurrency: "", targetCurrency: ""))
        SuccessView(viewModel: viewModel)
    }
}
