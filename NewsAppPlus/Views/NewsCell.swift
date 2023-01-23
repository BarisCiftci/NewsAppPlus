//
//  NewsCell.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

struct NewsCell: View {
    let news: NewsViewModel
    let image: Image
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                .clipped()
                .cornerRadius(12)
            
            HStack {
                Text("Author: \(news.author)")
                    .padding(.top, 10)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
            }
            
            Text(news.title)
                .font(.title)
                .fontWeight(.black)
                .lineLimit(3)
                
            Text(news.description)
                .font(.headline)
                .padding(.bottom)
        }
        .sheet(isPresented: $isPresented) {
            NewsArticleWebView(newsUrl: self.news.url)
        }
        
        .onTapGesture{
            self.isPresented.toggle()
        }
        
    }
}
