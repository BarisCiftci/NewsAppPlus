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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                .cornerRadius(20)
            Text(news.author)
                .font(.subheadline)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(10)
            
            Text(news.title)
                .font(.subheadline)
                .foregroundColor(.black)
                .sheet(isPresented: $isPresented) {
                    NewsArticleWebView(newsUrl: self.news.url)
                }
                .onTapGesture {
                    self.isPresented.toggle()
                }
            
            Text(news.description)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

