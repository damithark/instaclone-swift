//
//  ProfileHeaderView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-07-12.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack (spacing: 10) {
            // Profile pic and info
            HStack {
                CircleImageView(user: user, diameter: .large)
                
                Spacer()
                HStack (spacing: 8) {
                    VirticalStatView(value: 345, title: "Posts")
                    
                    VirticalStatView(value: 1507, title: "Followers")
                    
                    VirticalStatView(value: 2435, title: "Following")
                }
            }
            .padding(.horizontal)
            
            // Name and bio
            VStack (alignment: .leading, spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Text(user.username)
                    .font(.footnote)
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            HStack {
                Button {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    } else {
                        print("Follow user...")
                    }
                } label: {
                    Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 180, height: 32)
                        .background(user.isCurrentUser ? .white : Color(.systemBlue))
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                        )
                }
                
                Button {
                    if user.isCurrentUser {
                        self.shareTapped()
                    } else {
                        print("Message")
                    }
                } label: {
                    Text(user.isCurrentUser ? "Share Profile" : "Message")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 180, height: 32)
                        .background(user.isCurrentUser ? .white : Color(.systemBlue))
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                        )
                }
                
            }
            
            // Divider
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
    
    func shareTapped() {
        guard let shareUrl = URL(string: "https://www.instagram.com") else {
            print("No url found")
            return
        }

        let activityVC = UIActivityViewController(activityItems: [shareUrl], applicationActivities: [])
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
