//
//  RadioButtonRowList.swift
//  ExchangeApp
//
//  Created by Enis Terzioglu on 12.03.2022.
//

import SwiftUI

struct RadioButtonRowList: View {
    @Binding var list: [RadioButtonModel]
    @Binding var selected: RadioButtonModel?

    var body: some View {
        VStack(spacing: 16) {
            ForEach(list) { item in
                RadioButtonRow(data: .constant(item))
                    .onTapGesture {
                        updateList(selected: item)
                    }
            }
        }
    }

    private func updateList(selected: RadioButtonModel) {
        list.enumerated().forEach { index in
            list[index.offset].isSelected = false
            if list[index.offset].text == selected.text {
                list[index.offset].isSelected = true
                self.selected = selected
            }
        }
    }
}


//struct RadioButtonRowList_Previews: PreviewProvider {
//    static var previews: some View {
//        RadioButtonRowList()
//    }
//}
