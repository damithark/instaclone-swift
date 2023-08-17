//
//  VideoShortsView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-08-16.
//

import SwiftUI

struct VideoShortsView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "camera")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 34, height: 26)
                }
                .padding(.trailing, 20)
            }
            Spacer()
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
                    Text("925.5k")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "message")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                    Text("12.5k")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                    Text("564.5k")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 6)
                    }
                    .padding(.top, 8)
                }
            }
            .padding(20)
            .background(.black)
        }
        .background(.black)
    }
}

struct VideoShortsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoShortsView()
    }
}
