//
//  CircleImageView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-15.
//

import SwiftUI
import Kingfisher

struct CircleImageView: View {
    
    let user: User
    let diameter: CGFloat
    
    var body: some View {
        if let imageUrl = user.profileImgUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: diameter, height: diameter)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: diameter, height: diameter)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(user: User.MOCK_USERS[0], diameter: 80)
    }
}
