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
                .padding(.leading, 20)
                .padding(.trailing, 5)
            Text(User.MOCK_USERS[0].username + " " + Notification.MOCK_Notification[0].caption)
                .font(.footnote)
                .fontWeight(.light)
                .padding(.trailing, 10)
            Spacer()
            switch Notification.MOCK_Notification[0].notificationType {
            case "Like":
                Image("FieldSittingG")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom)
                    .padding(.trailing, 20)
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
