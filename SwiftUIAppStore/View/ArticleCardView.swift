//
//  ArticleCardView.swift
//  SwiftUIAppStore
//
//  Created by Marble Interactive SL on 9/2/23.
//

import SwiftUI

struct ArticleCardView: View {
    
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage
    var content: String = ""
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: min(image.size.height/3, 500))
                    .border(Color(.sRGB, red:150/255, green: 150/255, blue: 150/255, opacity: 0.1), width: isShowContent ? 0 : 1)
                    .cornerRadius(15)
                    .overlay {
                        ArticleExcerptView(category: category,
                                           headline: headline,
                                           subHeadline: subHeadline,
                                           isShowContent: $isShowContent)
                        .cornerRadius(isShowContent ? 0 : 15)
                    }
                
                //Content
                if isShowContent {
                    Text(content)
                        .foregroundColor(Color(.darkGray))
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)
                        .padding(.bottom, 50)
                        .transition(.move(edge: .bottom))
                }
            }
        }
        .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3), radius: isShowContent ? 0 : 15)
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(category: sampleArticles[0].category, headline: sampleArticles[0].headline, subHeadline: sampleArticles[0].subHeadline, image: sampleArticles[0].image, content: sampleArticles[0].content, isShowContent: .constant(false))
            .previewDisplayName("Card View (no Content)")
        
        ArticleCardView(category: sampleArticles[0].category, headline: sampleArticles[0].headline, subHeadline: sampleArticles[0].subHeadline, image: sampleArticles[0].image, content: sampleArticles[0].content, isShowContent: .constant(true))
            .previewDisplayName("Card View (with Content)")

    }
}
