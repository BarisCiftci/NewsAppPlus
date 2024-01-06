//
//  NewsView.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            
            // Display list of articles displayArticles
            List(newsViewModel.articles, id: \.source.name) { article in
                
                // Display article details
                VStack(alignment: .leading) {
                    // Display article image
                    ZStack {
                        NavigationLink("", destination: NewsWebView(urlString: article.url))
                        AsyncImage(url: URL(string: article.urlToImage ?? "https://media.discordapp.net/attachments/989268324884049960/1061765655889719326/6AC54581-051B-4930-B145-B38B37DAA3DF_1_105_c.jpeg")) { image in
                            image.resizable()
                        }
                    placeholder: {
                        Image(systemName: "photo.artframe")
                            .resizable()
                    }.frame(height: 200)
                        
                    }
                    
                    // Display article content
                    ArticleContent(newArticle: article)
                }
            }
            .listStyle(.plain)
            .task {
                await newsViewModel.fetchNews()
            }
            .refreshable {
                await newsViewModel.fetchNews()
            }
            .navigationTitle("News")

        }
    }
}

#Preview {
    NewsView()
}

struct ArticleContent: View {
    
    var newArticle: Article
    
    var body: some View {
        Text(newArticle.title ?? "Unknown Title")
            .font(.headline)
            .fontWeight(.black)
        Text(newArticle.description ?? "Unknown description")
            .font(.subheadline)
            .lineLimit(2)
        
        Text(newArticle.source.name)
            .font(.footnote)
            .foregroundStyle(.pink)
        
        Text(newArticle.author ?? "Unknown Author")
            .font(.footnote)
            .bold()
            .foregroundStyle(.gray)
    }
}
