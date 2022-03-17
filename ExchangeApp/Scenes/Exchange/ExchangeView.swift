//
//  ExchangeView.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

enum CurrencyPickerType {
    case base
    case target
}

struct ExchangeView: View {
    @StateObject private var viewModel: ExchangeViewModel = ExchangeViewModel()
    @State var showSheet: Bool = false
    @State var showSuccess: Bool = false
    @State var showAlert: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationLink(destination: SuccessView(viewModel: SuccessViewModel(data: viewModel.getSuccessData())), isActive: $showSuccess) { EmptyView() }.navigationBarBackButtonHidden(true)
                content
                    .navigationTitle("Exchange")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        viewModel.getConversionRate()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Confirm Operation"), message: Text(viewModel.getConfirmMessage()),
                              primaryButton: .default(Text("Confirm"), action: {
                            showSuccess.toggle()
                        }),
                              secondaryButton: .cancel(Text("Cancel"), action: { }))
                    }
            }
        }
    }

    private var content: some View {
        VStack(alignment: .center, spacing: 8) {
            currencyPickerContent
            AmountView(amount: $viewModel.amount, finalAmount: $viewModel.finalAmount)
                .padding(.top, 96)
            Spacer()
            BorderedText(viewModel.currencyRate)
            primaryButton
        }
        .fullScreenCover(isPresented: $showSheet, onDismiss: {
            viewModel.setNewSelection()
        }) {
            CurrencyList(list: $viewModel.currencyList, selected: $viewModel.selectedCurrency)
        }
    }

    private var currencyPickerContent: some View {
        HStack(spacing: 16) {
            SelectableButton(viewModel.baseCurrency) {
                viewModel.currencyPickerSelection(type: .base)
                showSheet.toggle()
            }

            RoundedButton("arrow.left.arrow.right") {
                viewModel.reverseCurrecySelection()
            }

            SelectableButton(viewModel.targetCurrency) {
                viewModel.currencyPickerSelection(type: .target)
                showSheet.toggle()
            }
        }
        .padding(.top, 32)
    }

    private var primaryButton: some View {
        PrimaryButton("Exchange") {
            showAlert.toggle()
        }
    }

}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
