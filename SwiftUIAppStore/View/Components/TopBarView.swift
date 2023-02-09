//
//  TopBarView.swift
//  SwiftUIAppStore
//
//  Created by Marble Interactive SL on 9/2/23.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            Spacer()
            
            AvatarView(image: "profile", width: 40, height: 40)
        }
    }
    

}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
