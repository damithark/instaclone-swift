//
//  SingleUserFeedView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-23.
//

import SwiftUI


struct SingleUserFeedView: View {
    
    @State var posts: [Post]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 32) {
                    ForEach(posts, id: \.self) { post in
                        MainFeedCell(user: post.user ?? User.MOCK_USERS[0], post: post, viewModel: FeedViewModel())
                    }
                }
                .padding(.top, 8)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("NavBarLogo")
                        .resizable()
                        .frame(width: 104, height: 40)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis.message")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct SingleUserFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SingleUserFeedView(posts: [])
    }
}
