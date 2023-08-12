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
        self.posts = try snapshots.documents.compactMap({ document in
            let post = try document.data(as: Post.self)
            return post
        })
        
        self.posts = try snapshots.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
