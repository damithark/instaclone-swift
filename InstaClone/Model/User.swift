//
//  User.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Damitha", profileImageUrl: nil, fullName: "Damitha Raveendra", bio: "Get rich or die trying", email: "deamonsarea52@gmail.com "),
        .init(id: NSUUID().uuidString, username: "Nadee.Perera", profileImageUrl: nil, fullName: "Nadeesha Perera", bio: "Love,laugh,live", email: "nadee.perera@gmail.com "),
        .init(id: NSUUID().uuidString, username: "Yuki_Ming", profileImageUrl: nil, fullName: "Yukiyon Ming", bio: "Likes to hike and travel", email: "yaki.mingg@gmail.com "),
        .init(id: NSUUID().uuidString, username: "ZeldaPink", profileImageUrl: nil, fullName: "Zeldana Kamaric", bio: "Acting is not enough to be happy", email: "zeldana.k@gmail.com "),
        .init(id: NSUUID().uuidString, username: "Isuri.Thenuwara", profileImageUrl: nil, fullName: "Isuri Thenuwara", bio: "Know me before you judge me", email: "isuri.thenuwara@gmail.com "),
        .init(id: NSUUID().uuidString, username: "Greta_Hope", profileImageUrl: nil, fullName: "Greta Hope", bio: "Environment is the key. Pay attention", email: "greta_hope02@gmail.com"),
    ]
}

