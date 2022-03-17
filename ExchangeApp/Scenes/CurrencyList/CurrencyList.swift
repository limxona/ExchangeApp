//
//  CurrencyList.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct CurrencyList: View {
    @Environment(\.presentationMode) var presentationMode

    var list: Binding<[RadioButtonModel]>
    var selected: Binding<RadioButtonModel?>

    
    var body: some View {
        VStack {
            Spacer()
            content
        }
        .background(Color.appBlack.opacity(0.1))
    }

    var content: some View {
        VStack(spacing: 0) {
            header
            RadioButtonRowList(list: list, selected: selected)
                .padding(16)
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding(8)

    }

    var header: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .foregroundColor(Color.appBlue)
                .font(Font.body.weight(.semibold))
                .padding(16)

                Text("Select Currency")
                    .font(.body)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .offset(x: -16)
            }

            Color.appRegularGray.frame(height: 1)
        }
    }
}

//struct CurrencyList_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrencyList()
//    }
//}
