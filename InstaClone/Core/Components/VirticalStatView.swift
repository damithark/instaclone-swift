//
//  VirticalStatView.swift
//  InstaClone
//
//  Created by Damitha Raveendra on 2023-06-15.
//

import SwiftUI

struct VirticalStatView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct VirticalStatView_Previews: PreviewProvider {
    static var previews: some View {
        VirticalStatView(value: 0, title: "Unknown")
    }
}
