//
//  VideoShortsView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-16.
//

import SwiftUI

struct VideoShortsView: View {
    var body: some View {
        VStack (alignment: .trailing, spacing: 20) {
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            }
            
            Button {
                
            } label: {
                Image(systemName: "message")
                    .imageScale(.large)
            }
            
            Button {
                
            } label: {
                Image(systemName: "paperplane")
                    .imageScale(.large)
            }
        }
    }
}

struct VideoShortsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoShortsView()
    }
}
