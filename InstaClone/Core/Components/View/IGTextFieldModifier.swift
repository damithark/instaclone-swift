//
//  IGTextFieldModifier.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-22.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
        
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
