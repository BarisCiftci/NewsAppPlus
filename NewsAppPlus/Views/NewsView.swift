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
            
            List(newsViewModel.articles, id: \.source.name) { article in
                
                VStack(alignment: .leading) {
                    ZStack {
                        NavigationLink("", destination: NewsWebView(urlString: article.url))
                        AsyncImage(url: URL(string: article.urlToImage ?? "https://media.discordapp.net/attachments/989268324884049960/1061765655889719326/6AC54581-051B-4930-B145-B38B37DAA3DF_1_105_c.jpeg")) { image in
                                            image
                                .resizable()
                                        } placeholder: {
                                            Image(systemName: "photo.artframe")
                                                .resizable()
        }
                                    .frame(height: 200)
                    }
                    Text(article.title ?? "Unknown Title")
                        .font(.headline)
                        .fontWeight(.black)
                    
                    Text(article.description ?? "Unknown Title")
                        .font(.subheadline)
                        .lineLimit(2)
                    
                    Text(article.source.name)
                        .font(.footnote)
                        .foregroundStyle(.pink)
                    
                    Text(article.author ?? "Unknown Author")
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(.gray)
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
