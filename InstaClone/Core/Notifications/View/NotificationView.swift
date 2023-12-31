//
//  NotificationView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-09-03.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer(minLength: 30)
                    ForEach(Notification.MOCK_Notification, id: \.self) { notification in
                        NotificationCell(notification: notification)
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
