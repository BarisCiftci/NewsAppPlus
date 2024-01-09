//
//  NewsView.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    private var navigationTitle: String = "News App"
    
    var body: some View {
        NavigationView {
            
            // Display list of articles displayArticles
            List(newsViewModel.articles, id: \.source.id) { article in
                
                // Display article details
                ArticleDetails(newArticle: article)
            }
            .listStyle(.plain)
            .task {
                await newsViewModel.fetchNews()
            }
            .refreshable {
                await newsViewModel.fetchNews()
            }
            .navigationTitle(navigationTitle)

        }
    }
}

private struct ArticleDetails: View {
    var newArticle: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display article image
            let imageUrl = newArticle.urlToImage ?? newArticle.defaultValue().urlToImage
            ArticleImage(newImageUrl: imageUrl, newArticleUrl: newArticle.url)
            
            // Display article content
            ArticleContent(newArticle: newArticle)
        }
    }
}

private struct ArticleImage: View {
    var newImageUrl: String
    var newArticleUrl: String
    
    var body: some View {
        ZStack {
            NavigationLink("", destination: NewsWebView(urlString: newArticleUrl))
            AsyncImage(url: URL(string: newImageUrl)) { image in
                image.resizable()
            }
        placeholder: {
            Image(systemName: "photo.artframe")
                .resizable()
        }.frame(height: 200)
            
        }
    }
}

private struct ArticleContent: View {
    var newArticle: Article
    
    var body: some View {
        Text(newArticle.title ?? newArticle.defaultValue().title)
            .font(.headline)
            .fontWeight(.black)
        Text(newArticle.description ?? newArticle.defaultValue().description)
            .font(.subheadline)
            .lineLimit(2)
        
        Text(newArticle.source.name)
            .font(.footnote)
            .foregroundStyle(.pink)
        
        Text(newArticle.author ?? newArticle.defaultValue().author)
            .font(.footnote)
            .bold()
            .foregroundStyle(.gray)
    }
}




#Preview {
    NewsView()
}
