//
//  CircleImageView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-15.
//

import SwiftUI
import Kingfisher

enum CircularImageSize {
    case small
    case medium
    case large
    
    var dimention: CGFloat {
        switch self {
        case .small:
            return 40
        case .medium:
            return 60
        case .large:
            return 80
        }
    }
}

struct CircleImageView: View {
    
    let user: User
    let diameter: CircularImageSize
    
    var body: some View {
        if let imageUrl = user.profileImgUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: diameter.dimention, height: diameter.dimention)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: diameter.dimention, height: diameter.dimention)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(user: User.MOCK_USERS[0], diameter: CircularImageSize.large)
    }
}
