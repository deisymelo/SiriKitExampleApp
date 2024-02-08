//
//  ItemsListView.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 18/10/23.
//

import SwiftUI

struct ItemsListView: View {
    @StateObject private var viewModel = ModelData()
    private let emptyState = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.list) { item in
                    ItemCell(item: item)
                }
                .onDelete(perform: deleteItems)
            }
            .onEmpty(for: viewModel.list.isEmpty, with: emptyState)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddItemView()) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Shopping List")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                reloadData()
            })
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            viewModel.deleteItems(offsets: offsets)
            reloadData()
        }
    }
    
    private func reloadData() {
        viewModel.fetchItemsList()
    }
}

#Preview {
    ItemsListView()
}
