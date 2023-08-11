//
//  SearchView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink (value: user) {
                            HStack {
                                CircleImageView(user: user, diameter: .small)
                                VStack (alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullName = user.fullName {
                                        Text(fullName)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
                
                .searchable(text: $searchText, prompt: "Search...")
                .padding(.top, 8)
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
