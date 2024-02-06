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
    @State private var showAlert = false
    @State private var favoriteArticles: [String] = UserDefaults.standard.stringArray(forKey: "favoriteArticles") ?? []
    
    var body: some View {
        VStack{
            TabView(selection: $currentSlideIndex) {
                ForEach(0..<min(newsViewModel.articles.filter { $0.source.name == selectedSource }.count, maxSlides), id: \.self) { slide in
                    
                    SlieNewsDetails(newArticle: newsViewModel.articles.filter { $0.source.name == selectedSource }[slide])
                }
            }
            .padding(.horizontal, 8)
            .tabViewStyle(PageTabViewStyle())
            .onAppear(){
                startTimer()
            }
        }
        .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("There is no news data"),
                        message: Text("Please go back to source view"),
                        dismissButton: .default(Text("OK"))
                    )
                }
        NavigationView {
            
            // Display list of articles displayArticles
            List(newsViewModel.articles.filter { $0.source.name == selectedSource }, id: \.url) { article in
                
                // Display article details
                ArticleNewsDetails(newArticle: article)
                Button(action: {
                    toggleFavorite(article.map().url)
                }) {
                    Image(systemName: isArticleFavorite(article.map().url) ? "heart.fill" : "heart")
                        .foregroundColor(isArticleFavorite(article.map().url) ? .red : .gray)
                }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedArticlesView()) {
                        Text("Favorites")
                    }
                }
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            // Filter articles by the selected source
            let filteredArticles = newsViewModel.articles.filter { $0.source.name == selectedSource }
            
            // Check if the filtered articles count is greater than zero
            if !filteredArticles.isEmpty {
                // Update currentSlideIndex with animation
                withAnimation {
                    currentSlideIndex = (currentSlideIndex + 1) % min(filteredArticles.count, maxSlides)
                }
            } else {
                self.showAlert = true
            }
        }
    }
    
    private func toggleFavorite(_ articleTitle: String) {
        if isArticleFavorite(articleTitle) {
            favoriteArticles.removeAll(where: { $0 == articleTitle })
        } else {
            favoriteArticles.append(articleTitle)
        }
        
        UserDefaults.standard.setValue(favoriteArticles, forKey: "favoriteArticles")
    }
    
    private func isArticleFavorite(_ articleTitle: String) -> Bool {
        return favoriteArticles.contains(articleTitle)
    }
}

