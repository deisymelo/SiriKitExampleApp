//
//  AddItemView.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 19/10/23.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var itemTitleValue: String = ""
    private var viewModel = ModelData()
    
    var body: some View {
        VStack(alignment: .center,
               spacing: 8,
               content: {
            Text("Add a new item")
                .padding()
            
            TextField("Enter an item", text: $itemTitleValue)
                .textFieldStyle(.roundedBorder)
            Button("Save") { addItem() }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                .tint(.blue)
                .padding()
            Spacer()
        })
        .padding(16)
    }
    
    private func addItem() {
        guard !itemTitleValue.isEmpty else { return }
        viewModel.saveItem(itemTitleValue)
        dismiss()
    }
}

#Preview {
    AddItemView()
}
