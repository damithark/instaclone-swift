//
//  UploadPostViewModel.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-07-12.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var postImage: Image?
    private var uiImageForUpload: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImageForUpload = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadAPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImageForUpload else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage, path: .postImages) else { return }
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, isLiked: false, imgURL: imageUrl, timeStamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
    
}
