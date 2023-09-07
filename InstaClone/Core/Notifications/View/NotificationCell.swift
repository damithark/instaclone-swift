//
//  NotificationCell.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-09-04.
//

import SwiftUI

struct NotificationCell: View {
    
    let notification: Notification
    
    var body: some View {
        HStack (alignment: .top) {
            CircleImageView(user: notification.user ?? User.MOCK_USERS[0], diameter: .small)
                .padding(.leading, 20)
                .padding(.trailing, 5)
            let user = notification.user?.username ?? ""
            Text("\(user) \(notification.caption)")
                .font(.footnote)
                .fontWeight(.light)
                .padding(.trailing, 10)
            Spacer()
            switch notification.notificationType {
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
                Text("Following")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .frame(width: 100, height: 30)
                    .background(.gray)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    .padding(.trailing, 20)
            }
            case "Follow":
            Button {
            
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .frame(width: 80, height: 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    .padding(.trailing, 20)
            }
            default:
                Text("")
            }
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell(notification: Notification.MOCK_Notification[0])
    }
}
