//
//  NewsListView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

struct NewsListView: View {
    let newsCollection: [NewsViewModel]
    let imageData: [String: Data]
    
    var body: some View {
        List(self.newsCollection, id: \.url) {
            news in
            NewsCell(news: news, image: Image(uiImage: self.imageData[news.urlToImage] == nil ? UIImage(systemName: "photo.fill")! : UIImage(data: self.imageData[news.urlToImage]!)!))
        }
    }
}

