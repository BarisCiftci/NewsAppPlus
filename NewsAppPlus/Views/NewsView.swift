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
                        
                        SlieNewsDetails(newArticle: newsViewModel.articles.filter { $0.source.name == selectedSource }[slide])
                    }
                }
                .padding(.horizontal, 8)
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
                    ArticleNewsDetails(newArticle: article)
                    
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
