//
//  ProfileView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-14.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                // Header
                ProfileHeaderView(user: user)
                
                // Post grid view
                PostGridItemView(user: user)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
