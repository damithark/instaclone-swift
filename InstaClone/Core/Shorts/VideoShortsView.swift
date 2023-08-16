//
//  VideoShortsView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-16.
//

import SwiftUI

struct VideoShortsView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack (spacing: 20) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
            }
        }
        .padding(20)
        .background(.black)
    }
}

struct VideoShortsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoShortsView()
    }
}
