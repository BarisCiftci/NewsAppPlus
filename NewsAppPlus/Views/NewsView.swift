//
//  NewsView.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    let selectedSource: String
    @State private var currentSlideIndex: Int = 0
    let maxSlides = 2
    @State private var isTabViewHidden = false
    
    var body: some View {
        VStack{
            Spacer()
            if !isTabViewHidden {
                TabView(selection: $currentSlideIndex) {
                    ForEach(0..<min(newsViewModel.articles.filter { $0.source.name == selectedSource }.count, maxSlides), id: \.self) { slide in
                        
                        ArticleDetails(newArticle: newsViewModel.articles.filter { $0.source.name == selectedSource }[slide])
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .onAppear(){
                    startTimer()
                }
            }
            Button(action: {isTabViewHidden.toggle()}, label: {
                Image(systemName: isTabViewHidden ? "arrow.down" : "arrow.up")
                    .foregroundColor(.pink)
            })
            NavigationView {
                
                // Display list of articles displayArticles
                List(newsViewModel.articles.filter { $0.source.name == selectedSource }, id: \.url) { article in
                    
                    // Display article details
                    ArticleDetails(newArticle: article)
                    
                }
                .listStyle(.plain)
                .task {
                    newsViewModel.fetchNewsForCategory(category: Category.BUSINESS)
                }
                .refreshable {
                    newsViewModel.fetchNewsForCategory(category:  Category.BUSINESS)
                }
                .navigationTitle(selectedSource)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            withAnimation {
                currentSlideIndex = (currentSlideIndex + 1) % min(newsViewModel.articles.filter { $0.source.name == selectedSource }.count, maxSlides)
            }
        }
    }
}

private struct ArticleDetails: View {
    var newArticle: ArticleDto
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display article image
            let imageUrl = newArticle.map().urlToImage
            ArticleImage(newImageUrl: imageUrl, newArticleUrl: newArticle.map().url)
            
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
            NavigationLink(destination: NewsWebView(urlString: newArticleUrl)) { EmptyView() }
            AsyncImage(url: URL(string: newImageUrl)) { image in
                image.resizable()
                    .modifier(ImageModifier())
            }
        placeholder: {
            
            Image(systemName: Constant.IMAGE_PLACEHOLDER)
                .resizable()
                .modifier(ImageModifier())
        }
            
        }
    }
}

private struct ArticleContent: View {
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

struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width * 0.95/1, height: UIScreen.main.bounds.height * 1/3.5)
            .cornerRadius(12)
    }
}
