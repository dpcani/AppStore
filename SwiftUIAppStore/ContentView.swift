//
//  ContentView.swift
//  SwiftUIAppStore
//
//  Created by Marble Interactive SL on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                TopBarView()
                    .padding(.horizontal, 20)
                
                ForEach(sampleArticles.indices, id: \.self) { index in
                    ArticleCardView(category: sampleArticles[index].category,
                                    headline: sampleArticles[index].headline,
                                    subHeadline: sampleArticles[index].subHeadline,
                                    image: sampleArticles[index].image, content:
                                        sampleArticles[index].content, isShowContent:.constant(false))
                    .padding(.horizontal, 20)
                    .frame(height: min(sampleArticles[index].image.size.height/3, 500))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
