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
                        CategoryChipsView(category: category, newsViewModel: newsViewModel)
                    }
                }
                .padding(.horizontal, 8)
            }
            NavigationView {
                // Display list of articles displayArticles
                List(newsViewModel.articles, id: \.source.id) { article in
                    ZStack {
                        NavigationLink(destination: NewsView(selectedSource: article.source.name))
                        { EmptyView() }
                        // Display article details
                        ArticleSourceDetails(newArticle: article)
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

#Preview {
    SourceView()
}
