//
//  NewsListView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 12/02/2023.
//

import SwiftUI

struct NewsCell: View {
    
    let news: NewsViewModel
    let image: Image
    
    @State private var isPresented: Bool = false
    @State private var bookmarkButtonPressed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                    .cornerRadius(20)
            
                    .overlay(
                        Button(action: {
                            bookmarkButtonPressed.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "bookmark.fill")
                                    .foregroundColor(bookmarkButtonPressed ? Color.green : Color.gray)
                                    .font(.system(size: 48))
                                    .font(.body)
                                    .padding(.horizontal, 30)
                                    .offset(y: -8)
                                .shadow(radius: 2, x: 4 , y: 4)
                            }
                        }), alignment: .topLeading
                    )
                
             
                Text("Author: \(news.author)")
                    .font(.subheadline)
            
            
            Text(news.title)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(2)
                .sheet(isPresented: $isPresented) {
                    NewsArticleWebView(newsUrl: self.news.url)
                }
                .onTapGesture {
                    self.isPresented.toggle()
                }
            
            Text(news.description)
                .font(.body)
        }
    }
}

