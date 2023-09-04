//
//  Notification.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-09-04.
//

import Foundation

struct Notification: Identifiable, Hashable, Codable {
    let id: String
    let caption: String
    let notificationType: String
    var isNew: Bool
    var user: User?
}

extension Notification {
    static var MOCK_Notification: [Notification] = [
        .init(id: NSUUID().uuidString, caption: "liked you photo", notificationType: "Like", isNew: true, user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, caption: "started following you", notificationType: "Follower", isNew: true, user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, caption: "who you might know, is on Instaclone", notificationType: "Follow", isNew: true, user: User.MOCK_USERS[2])
    ]
}
