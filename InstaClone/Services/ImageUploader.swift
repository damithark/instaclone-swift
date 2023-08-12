//
//  ImageUploader.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-10.
//
import UIKit
import Firebase
import FirebaseStorage

enum FirebaseStoragePath {
    case profileImages
    case postImages
    
    var value: String {
        switch self {
        case .profileImages:
            return "/profile_images/"
        case .postImages:
            return "/post_images/"
        }
    }
}

struct ImageUploader {
    
    static func uploadImage(image: UIImage, path: FirebaseStoragePath) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "\(path.value)\(fileName)")
        
        do {
            let _ =  try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
    
}
