//
//  NewsView.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State private var searchSource = String()
    var filteredArticles: [ArticleDto] {
           if searchSource.isEmpty {
               return newsViewModel.articles
           } else {
               return newsViewModel.articles.filter { article in
                   article.source.name.localizedCaseInsensitiveContains(searchSource)
               }
           }
       }
    
    var body: some View {
        VStack{
            Text(Constant.NAVIGATION_TITLE)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryChip(category: category, newsViewModel: newsViewModel)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 2/1)
            }
            
            SearchBar(searchSource: $searchSource)
            
            NavigationView {
                
                
                // Display list of articles displayArticles
                List(filteredArticles, id: \.source.id) { article in
                    
                    // Display article details
                    ArticleDetails(newArticle: article)
                    
                }
                .listStyle(.plain)
                .task {
                    newsViewModel.fetchNewsForCategory(category: Category.ALL)
                }
                .refreshable {
                    newsViewModel.fetchNewsForCategory(category:  Category.ALL)
                }
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
                isClicked ? newsViewModel.fetchNewsForCategory(category: category) : newsViewModel.fetchNewsForCategory(category: Category.ALL)
            },
            label: {
                HStack {
                    Text(category.name())
                    
                    Button(
                        action: {
                            isClicked.toggle()
                            isClicked ? newsViewModel.fetchNewsForCategory(category: category) : newsViewModel.fetchNewsForCategory(category: Category.ALL)
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

struct SearchBar: View {
    @Binding var searchSource: String

    var body: some View {
        HStack {
            TextField(Constant.SEARCH_SOURCE, text: $searchSource)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 8)

            if !searchSource.isEmpty {
                Button(action: {
                searchSource = String()
                }) {
                    Image(systemName: Constant.CLOSE_ICON)
                        .foregroundColor(Color(.systemGray))
                        .padding(8)
                }
            }
        }
    }
}


#Preview {
    NewsView()
}

