//
//  MainFeedView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-15.
//

import Foundation
import SwiftUI

struct MainFeedView: View {
    
    let user: User
    @State private var isShowingNotificationView = false
    @State private var isShowingMessageView = false
    @StateObject var viewModel = FeedViewModel()
    
//    let postUsers = ["Nadee.Perera", "Damitha", "Yuki_Ming", "ZeldaPink", "Isuri.Thenuwara", "Greta_Hope", "Nadee.Perera"]
//    let profImages = ["Prof4", "prof_img", "Prof2", "Prof3", "Prof5", "Prof1", "Prof4"]
//    let postImages = ["LipstickG", "CircleLights", "FieldRunningG", "SunflowerG", "FlowerMacro", "SeaSilhouette", "FieldSittingG"]
//    let likes = ["249K likes", "53K likes", "309K likes", "75k likes", "209K likes", "297K likes", "409K likes"]
//    let captions = ["Showing off my new dress and hair...", "One last shot before much awaited sleep", "Wanna spend all day here...", "My garden has sun, flowers and Sunflowers <3", "Macro came better than I thought. Still loving it !!!", "Best sunset ever...Don't want this sky to change", "Take time and relax. You deserve to enjoy some sunlight."]
//    let timeStamps = ["1h ago", "21h ago", "1 day ago", "2 days ago", "6h ago", "1 week ago", "14h ago"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 32) {
                    ForEach(viewModel.posts, id: \.self) { post in
                        MainFeedCell(user: user, post: post, viewModel: viewModel)
                    }
                }
                .padding(.top, 8)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("NavBarLogo")
                        .resizable()
                        .frame(width: 104, height: 40)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .onTapGesture {
                            isShowingNotificationView = true
                        }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis.message")
                        .imageScale(.large)
                        .padding(.leading, 10)
                        .onTapGesture {
                            isShowingMessageView = true
                        }
                }
            }
            .navigationDestination(isPresented: $isShowingNotificationView, destination: {
                NotificationView()
            })
            .navigationDestination(isPresented: $isShowingMessageView, destination: {
                MessagesView()
            })
        }
//        .onAppear {
//            let defaults = UserDefaults.standard
//            let checkChanges = defaults.bool(forKey: "UpdateFeed")
//            if checkChanges {
//                viewModel.posts = []
//                Task {
//                    try await viewModel.getPosts()
//                    defaults.set(false, forKey: "UpdateFeed")
//                }
//            }
//        }
    }
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView(user: User.MOCK_USERS[0])
    }
}
