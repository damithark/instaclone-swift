//
//  MainFeedCell.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-15.
//

import SwiftUI
import Kingfisher

struct MainFeedCell: View {
    
    let user: User
    let post: Post
    
    var body: some View {
        VStack {
            // User image + username
            HStack {
                if let user = post.user {
                    CircleImageView(user: user, diameter: .small)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading, 8)
            
            // post image
            KFImage(URL(string: post.imgURL))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
//            Image(post.imgURL)
//                .resizable()
//                .scaledToFill()
//                .frame(height: 400)
//                .clipShape(Rectangle())
            
            // action button row
            HStack (spacing: 16) {
                Button {
                    Task {  }
                } label: {
                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(post.isLiked ? .red : .black)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            // info section
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack {
                Text("\(post.user?.username ?? "") ")
                    .fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            // timestapm
            Text("6h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
            AddCommentView(user: user, placeholder: "Add a comment...", text: "")
        }
    }
}

struct MainFeedCell_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedCell(user: User.MOCK_USERS[0], post: Post.MOCK_POSTS[0])
    }
}
