//
//  NewsView.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State var teslaIsClicked = false
    @State var microsoftIsClicked = false
    @State var appleClicked = false
    
    var body: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        Task {
                            await teslaIsClicked ? newsViewModel.fetchNewsTesla() : newsViewModel.fetchNewsAll()
                        }
                        teslaIsClicked.toggle()
                        
                    },
                    
                    label: {
                        HStack {
                            Text("Tesla")
                            
                            Button(action: {
                                Task {
                                    await newsViewModel.fetchNewsAll()
                                }
                                teslaIsClicked.toggle()
                            }, label: {
                                Image(systemName: teslaIsClicked ? "xmark.circle.fill" : "")
                            })
                        }
                        .foregroundStyle(.white)
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(teslaIsClicked ? Color.pink : Color.gray)
                        .cornerRadius(24)
                        
                    })
                
                Button(
                    action: {
                        Task {
                            await microsoftIsClicked ? newsViewModel.fetchNewsMicrosoft() : newsViewModel.fetchNewsAll()
                        }
                        microsoftIsClicked.toggle()
                        
                    },
                    label: {
                        HStack {
                            Text("Microsoft")
                            
                            Button(action: {
                                Task {
                                    await newsViewModel.fetchNewsAll()
                                }
                                microsoftIsClicked.toggle()
                            }, label: {
                                Image(systemName: microsoftIsClicked ? "xmark.circle.fill" : "")
                            })
                        }
                        .foregroundStyle(.white)
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(microsoftIsClicked ? Color.pink : Color.gray)
                        .cornerRadius(24)
                        
                    })
                
                Button(
                    action: {
                        Task {
                            await appleClicked ? newsViewModel.fetchNewsApple() : newsViewModel.fetchNewsAll()
                            
                        }
                        appleClicked.toggle()
                        
                    },
                    
                    label: {
                        HStack {
                            Text("Apple")
                            
                            Button(action: {
                                Task {
                                    await newsViewModel.fetchNewsAll()
                                }
                                appleClicked.toggle()
                            }, label: {
                                Image(systemName: appleClicked ? "xmark.circle.fill" : "")
                            })
                        }
                        .foregroundStyle(.white)
                        .padding(8)
                        .padding(.horizontal, 8)
                        .background(appleClicked ? Color.pink : Color.gray)
                        .cornerRadius(24)
                        
                    })
            }
            NavigationView {
                
                // Display list of articles displayArticles
                List(newsViewModel.articles, id: \.source.id) { article in
                    
                    // Display article details
                    ArticleDetails(newArticle: article)
                    
                }
                
                .listStyle(.plain)
                .task {
                    await newsViewModel.fetchNewsAll()
                }
                .refreshable {
                    await newsViewModel.fetchNewsAll()
                }
                .navigationTitle(Constant.NAVIGATION_TITLE)
                
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

