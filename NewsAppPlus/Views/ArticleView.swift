//
//  ArticleView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 28/01/2024.
//

import SwiftUI

struct ArticleView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ArticleSourceDetails: View {
    var newArticle: ArticleDto
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display article content
            ArticleContent(newArticle: newArticle, newArticleUrl: newArticle.map().url)
        }
    }
}

struct ArticleContent: View {
    var newArticle: ArticleDto
    var newArticleUrl: String
    var body: some View {
            HStack {
                Text(newArticle.source.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.pink)
                Spacer()
            }
            
            HStack {
                Text(newArticle.map().description)
                    .font(.subheadline)
                    .lineLimit(2)
                Spacer()
            }
    }
}

struct ArticleNewsDetails: View {
    var newArticle: ArticleDto
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display article image
            let imageUrl = newArticle.map().urlToImage
            ArticleImage(newImageUrl: imageUrl, newArticleUrl: newArticle.map().url)
                .modifier(ImageModifier())
            
            // Display article content
            ArticleNewsContent(newArticle: newArticle)
        }
    }
}

struct SlieNewsDetails: View {
    var newArticle: ArticleDto
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display article image
            let imageUrl = newArticle.map().urlToImage
            ArticleImage(newImageUrl: imageUrl, newArticleUrl: newArticle.map().url)
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 0.95/1, height: UIScreen.main.bounds.height * 1/6)
                .cornerRadius(12)
            
            // Display article content
            SlideNewsContent(newArticle: newArticle)
        }
    }
}

struct ArticleImage: View {
    var newImageUrl: String
    var newArticleUrl: String
    
    var body: some View {
        ZStack {
            NavigationLink(destination: NewsWebView(urlString: newArticleUrl)) { EmptyView() }
            AsyncImage(url: URL(string: newImageUrl)) { image in
                image.resizable()
                    
            }
        placeholder: {
            
            Image(systemName: Constant.IMAGE_PLACEHOLDER)
                .resizable()
        }
            
        }
    }
}

struct ArticleNewsContent: View {
    var newArticle: ArticleDto
    
    var body: some View {
        Text(newArticle.map().title)
            .font(.headline)
            .fontWeight(.black)
        
        Text(newArticle.map().description)
            .font(.subheadline)
            .lineLimit(2)
        
        Text(newArticle.source.name)
            .font(.footnote)
            .foregroundStyle(.pink)
        
        Text(newArticle.map().author)
            .font(.footnote)
            .bold()
            .foregroundStyle(.gray)
    }
}

struct SlideNewsContent: View {
    var newArticle: ArticleDto
    
    var body: some View {
        Text(newArticle.map().title)
            .font(.headline)
            .fontWeight(.black)
            .lineLimit(1)
        
        Text(newArticle.source.name)
            .font(.footnote)
            .foregroundStyle(.pink)
    }
}
struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width * 0.95/1, height: UIScreen.main.bounds.height * 1/3.5)
            .cornerRadius(12)
    }
}
