//
//  EditProfileViewModel.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-07.
//

import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    @Published var fullName = ""
    @Published var bio = ""
    
    private var uiImageForUpload: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let selectedImg = UIImage(data: data) else { return }
        self.uiImageForUpload = selectedImg
        self.profileImage = Image(uiImage: selectedImg)
    }
    
    func updateUserData() async throws {
        
        // Update profile image if changed
        var profileData = [String: Any]()
        
        if let profImgForUpload = uiImageForUpload {
            let imageUrl = try? await ImageUploader.uploadImage(image: profImgForUpload)
            profileData["profileImageUrl"] = imageUrl
        }
        
        
        // udate name if changed
        if !fullName.isEmpty && user.fullName != fullName {
            profileData["fullName"] = fullName
        }
        
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            profileData["bio"] = bio
        }
        
        if !profileData.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(profileData)
        }
    }
    
}
