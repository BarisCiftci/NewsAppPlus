//
//  NewsListView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 12/02/2023.
//

import SwiftUI

struct NewsListView: View {
    
    
    @State private var showFavoritesOnly = false
    @State var isFavorite: Bool = false
    var filteredNews: [News] {
        newsCollection.filter { new in
            (!showFavoritesOnly || isFavorite)
            
        }
    }
    
    let newsCollection: [News]
    let imageData: [String: Data]
    var body: some View {
        FavoriteButton(isSet: $isFavorite)
        List(self.filteredNews, id: \.url) {
            news in
            NewsCell(news: news, image: Image(uiImage: (self.imageData[news.urlToImage] == nil ? UIImage(systemName: "photo.artframe")! : UIImage(data: self.imageData[news.urlToImage]!)) ?? UIImage(systemName: "photo.artframe")!))
        }
        
        .listStyle(.plain)
        
    }
    
    
}

struct IsFavorite: View {
    @Binding var isFavorite: Bool
    var body: some View {
        if isFavorite {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
        } else {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
    }
}
