//
//  MyProfileView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-25.
//

import SwiftUI

struct MyProfileView: View {
    
    let user: User
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Header
                    ProfileHeaderView(user: user)
                    
                    // Post grid view
                    PostGridItemView(user: user)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "plus.app")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                    .alert("Are you sure you want to logout?", isPresented: $showingAlert) {
                        Button("Yes", role: .none) { AuthService.shared.signOut() }
                        Button("No", role: .cancel) {}
                    }.tint(.black)
                }
            }
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView(user: User.MOCK_USERS[0])
    }
}
