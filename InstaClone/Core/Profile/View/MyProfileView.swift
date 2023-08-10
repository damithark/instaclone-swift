//
//  MyProfileView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-25.
//

import SwiftUI

struct MyProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Header
                    ProfileHeaderView(user: user)
                    
                    // Post grid view
                    PostGridItemView(posts: posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
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