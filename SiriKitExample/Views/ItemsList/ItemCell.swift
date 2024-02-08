//
//  ItemCell.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 18/10/23.
//

import SwiftUI

struct ItemCell: View {
    
    var item: Item
    
    var body: some View {
        HStack(alignment: .center, spacing: 16,  content: {
            Image(systemName: "basket.fill")
                .foregroundColor(.indigo)
                .frame(width: 15, height: 15)
            Text(item.title)
                .font(.subheadline)
            Spacer()
        })
        .padding(16)
    }
}

#Preview {
    ItemCell(item: Item(title: "Test"))
}
