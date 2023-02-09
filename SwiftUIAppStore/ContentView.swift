//
//  ContentView.swift
//  SwiftUIAppStore
//
//  Created by Marble Interactive SL on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showContent = false
    @State private var selectedArticleIndex: Int?
    @Namespace var nsArticle
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 40) {
                    TopBarView()
                        .padding(.horizontal, 20)
                    
                    ForEach(sampleArticles.indices, id: \.self) { index in
                        ArticleCardView(category: sampleArticles[index].category,
                                        headline: sampleArticles[index].headline,
                                        subHeadline: sampleArticles[index].subHeadline,
                                        image: sampleArticles[index].image, content:
                                            sampleArticles[index].content, isShowContent: $showContent)
                        .matchedGeometryEffect(id: index, in: nsArticle)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.35, dampingFraction: 0.65, blendDuration: 0.1)) {
                                selectedArticleIndex = index
                                showContent.toggle()
                            }
                        }
                        .padding(.horizontal, 20)
                        .frame(height: min(sampleArticles[index].image.size.height/3, 500))
                    }
                }
            }
            .opacity(showContent ? 0 : 1)
            if showContent, let selectedArticleIndex {
                ArticleCardView(
                    category: sampleArticles[selectedArticleIndex].category,
                    headline: sampleArticles[selectedArticleIndex].headline,
                    subHeadline: sampleArticles[selectedArticleIndex].subHeadline,
                    image: sampleArticles[selectedArticleIndex].image,
                    content: sampleArticles[selectedArticleIndex].content,
                    isShowContent: $showContent)
                .ignoresSafeArea()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
