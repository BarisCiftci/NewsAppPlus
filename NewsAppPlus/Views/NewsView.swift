//
//  NewsView.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State var microsoftIsClicked = false
    @State var appleClicked = false
    
    var body: some View {
        VStack{
            Text(Constant.NAVIGATION_TITLE)
            
            ScrollView(.horizontal) {
                HStack {
                    CategoryChip(category: Category.APPLE, newsViewModel: newsViewModel)
                    CategoryChip(category: Category.TESLA, newsViewModel: newsViewModel)
                    CategoryChip(category: Category.PEACE, newsViewModel: newsViewModel)
                    CategoryChip(category: Category.SAMSUNG, newsViewModel: newsViewModel)
                    CategoryChip(category: Category.MICROSOFT, newsViewModel: newsViewModel)
                }
            }
            
            NavigationView {
                
                // Display list of articles displayArticles
                List(newsViewModel.articles, id: \.source.id) { article in
                    
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
                            Image(systemName: isClicked ? "xmark.circle.fill" : "plus.circle.fill")
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
            NavigationLink("", destination: NewsWebView(urlString: newArticleUrl))
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

#Preview {
    NewsView()
}

