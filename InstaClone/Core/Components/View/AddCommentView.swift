//
//  AddCommentView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-15.
//

import SwiftUI

struct AddCommentView: View {
    
    let user: User
    let placeholder: String
    @State var text: String
    
    var body: some View {
        HStack {
            CircleImageView(user: user, diameter: .small)
            
            VStack {
                TextField(placeholder, text: $text)
                
            }
        }
        .font(.subheadline)
        .frame(height: 36)
        .padding(8)
    }
}

struct AddCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView(user: User.MOCK_USERS[0], placeholder: "Add a comment...", text: "")
    }
}
