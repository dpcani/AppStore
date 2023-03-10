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
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: isShowContent ? geometry.size.height * 0.7 : min(image.size.height/3, 500))
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
            }
            .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3), radius: isShowContent ? 0 : 15)
            
            if isShowContent {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut) {
                            isShowContent = false
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 26))
                            .foregroundColor(.white)
                            .opacity(0.7)
                    }
                }
                .padding(.top, 50)
                .padding(.trailing)
            }
        }
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(category: sampleArticles[1].category, headline: sampleArticles[1].headline, subHeadline: sampleArticles[1].subHeadline, image: sampleArticles[1].image, content: sampleArticles[1].content, isShowContent: .constant(false))
            .previewDisplayName("Card View (no Content)")
        
        ArticleCardView(category: sampleArticles[0].category, headline: sampleArticles[0].headline, subHeadline: sampleArticles[0].subHeadline, image: sampleArticles[0].image, content: sampleArticles[0].content, isShowContent: .constant(true))
            .previewDisplayName("Card View (with Content)")

    }
}
