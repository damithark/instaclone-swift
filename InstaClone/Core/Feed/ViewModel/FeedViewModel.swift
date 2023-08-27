//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-12.
//

import Foundation
import Firebase

@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task { try await getPosts() }
    }
    
    func getPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
    
    func updatePostLike(selectedPost: Post) async throws {
        
        var postData = [String: Any]()
        postData["isLiked"] = !selectedPost.isLiked
        if !postData.isEmpty {
            try await Firestore.firestore().collection("posts").document(selectedPost.id).updateData(postData)
        }
    }
}
