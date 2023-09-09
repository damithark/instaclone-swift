//
//  MessagesView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-09-03.
//

import SwiftUI

struct MessagesView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 12) {
                    
                }
                .searchable(text: $searchText, prompt: "Search...")
                .padding(.top, 8)
            }
            .navigationDestination(for: User.self, destination: { user in
                
            })
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
