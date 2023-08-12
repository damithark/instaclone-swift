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
        let snapshots = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshots.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            self.posts[i].user = postUser
        }
    }
}
