//
//  NotificationCell.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-09-04.
//

import SwiftUI

struct NotificationCell: View {
    
    var body: some View {
        HStack {
            CircleImageView(user: User.MOCK_USERS[0], diameter: .medium)
            Text(Notification.MOCK_Notification[0].caption)
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
