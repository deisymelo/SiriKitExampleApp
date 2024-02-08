//
//  List+Extensions.swift
//  SiriKitExample
//
//  Created by Deisy Melo on 19/10/23.
//

import SwiftUI

struct EmptyDataView: ViewModifier {
    let condition: Bool
    let message: String
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if condition {
            VStack{
                Spacer()
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        } else {
            content
        }
    }
}

extension List {
    func onEmpty(for condition: Bool, with message: String) -> some View {
        self.modifier(EmptyDataView(condition: condition, message: message))
    }
}
