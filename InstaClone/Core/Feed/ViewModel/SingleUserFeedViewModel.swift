//
//  SingleUserFeedViewModel.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-23.
//

import Foundation
import Firebase

class SingleUserFeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task { try await getPosts() }
    }
    @MainActor
    func getPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
    
}
