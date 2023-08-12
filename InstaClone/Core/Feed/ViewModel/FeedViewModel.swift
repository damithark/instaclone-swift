//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-12.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task { try await getPosts() }
    }
    @MainActor
    func getPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
