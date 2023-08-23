//
//  PostGridItemView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-07-12.
//

import SwiftUI
import Kingfisher

struct PostGridItemView: View {
    
    @StateObject var viewModel: PostGridItemViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridItemViewModel(user: user))
    }
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                let _ = print("Image URL: \(post.imgURL)")
                KFImage(URL(string: post.imgURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
                    .onTapGesture {
                        
                    }
            }
        }
    }
}

struct PostGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridItemView(user: User.MOCK_USERS[0])
    }
}
