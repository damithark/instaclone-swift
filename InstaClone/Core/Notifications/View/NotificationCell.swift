//
//  NotificationCell.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-09-04.
//

import SwiftUI

struct NotificationCell: View {
    
    var body: some View {
        HStack (alignment: .top) {
            CircleImageView(user: User.MOCK_USERS[0], diameter: .small)
                .padding(.trailing, 10)
            Text(User.MOCK_USERS[0].username + " " + Notification.MOCK_Notification[0].caption)
                .padding(.trailing, 10)
            switch Notification.MOCK_Notification[0].notificationType {
            case "Like":
                Image("FieldSittingG")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom)
            case "Follower":
            Button {
                
            } label: {
                
            }
            case "Follow":
            Button {
            
            } label: {
            
            }
            default:
                Text("")
            }
//            Notification.MOCK_Notification[0].notificationType == "Like" ? Button {
//
//            }
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
