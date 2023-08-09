//
//  PostGridItemView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-07-12.
//

import SwiftUI

struct PostGridItemView: View {
    
    var posts: [Post]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(posts, id: \.self) { post in
                Image(post.imgURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

struct PostGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridItemView(posts: Post.MOCK_POSTS)
    }
}
