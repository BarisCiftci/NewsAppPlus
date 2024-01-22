//
//  SourceView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 22/01/2024.
//

import SwiftUI

struct SourceView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State private var selectedSource: String?
    var body: some View {
        VStack{
            Text(Constant.APP_NAME)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryChip(category: category, newsViewModel: newsViewModel)
                    }
                }
                .padding(.horizontal, 8)
            }
            NavigationView {
                // Display list of articles displayArticles
                List(newsViewModel.articles, id: \.source.name) { article in
                    ZStack {
                        NavigationLink(destination: NewsView(selectedSource: article.source.name))
                        { EmptyView() }
                        // Display article details
                        ArticleDetails(newArticle: article)
                    }
                }
                .listStyle(.inset)
                .task {
                    newsViewModel.fetchNewsForCategory(category: Category.BUSINESS)
                }
                .refreshable {
                    newsViewModel.fetchNewsForCategory(category:  Category.BUSINESS)
                }
                .navigationTitle(Constant.SOURCES_TITLE)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

private struct CategoryChip: View {
    let category: Category
    @State private var isClicked = false
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        Button(
            action: {
                isClicked.toggle()
                isClicked ? newsViewModel.fetchNewsForCategory(category: category) : newsViewModel.fetchNewsForCategory(category: Category.BUSINESS)
            },
            label: {
                HStack {
                    Text(category.name())
                    
                    Button(
                        action: {
                            isClicked.toggle()
                            isClicked ? newsViewModel.fetchNewsForCategory(category: category) : newsViewModel.fetchNewsForCategory(category: Category.BUSINESS)
                        },
                        label: {
                            Image(systemName: isClicked ? Constant.CLOSE_ICON : Constant.PLUS_ICON)
                        })
                }
                .foregroundStyle(.white)
                .padding(8)
                .padding(.leading, 8)
                .background(isClicked ? Color.pink : Color.gray)
                .cornerRadius(24)
            }
        )
    }
}

private struct ArticleDetails: View {
    var newArticle: ArticleDto
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display article content
            ArticleContent(newArticle: newArticle, newArticleUrl: newArticle.map().url)
        }
    }
}

private struct ArticleContent: View {
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

#Preview {
    SourceView()
}
