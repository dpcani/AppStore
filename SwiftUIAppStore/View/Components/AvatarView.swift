//
//  AvatarView.swift
//  SwiftUIAppStore
//
//  Created by Marble Interactive SL on 9/2/23.
//

import SwiftUI

struct AvatarView: View {
    
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image: "profile", width: 40, height: 40)
    }
}
