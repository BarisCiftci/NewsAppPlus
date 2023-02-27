//
//  NewsListView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 12/02/2023.
//

import SwiftUI

struct NewsCell: View {
    let news: News
    let image: Image
    
    @State private var isPresented: Bool = false
    @State private var favoriteButtonPressed: Bool = false
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                    .cornerRadius(20)
        
            
            HStack {
                Text("Author: \(news.author)")
                    .font(.subheadline)
                
                Spacer()
                
                Button {
                    favoriteButtonPressed.toggle()
                } label: {
                    IsFavorite(isFavorite: $favoriteButtonPressed)
                }
            }
            
            
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

