//
//  Post.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-25.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    var isLiked: Bool
    let imgURL: String
    let timeStamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Showing off my new dress and hair...", likes: 145, isLiked: false, imgURL: "LipstickG", timeStamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "One last shot before much awaited sleep", likes: 73, isLiked: false, imgURL: "CircleLights", timeStamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Wanna spend all day here...", likes: 645, isLiked: false, imgURL: "FieldRunningG", timeStamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "My garden has sun, flowers and Sunflowers <3", likes: 487, isLiked: false, imgURL: "SunflowerG", timeStamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Macro came better than I thought. Still loving it !!!", likes: 998, isLiked: false, imgURL: "FlowerMacro", timeStamp: Timestamp(), user: User.MOCK_USERS[4]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Best sunset ever...Don't want this sky to change", likes: 231, isLiked: false, imgURL: "SeaSilhouette", timeStamp: Timestamp(), user: User.MOCK_USERS[5]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Take time and relax. You deserve to enjoy some sunlight.", likes: 745, isLiked: false, imgURL: "FieldSittingG", timeStamp: Timestamp(), user: User.MOCK_USERS[1])
    ]
}
