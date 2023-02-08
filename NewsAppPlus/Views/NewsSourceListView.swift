//
//  NewsListView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

struct NewsSourceListView: View {
    let newsCollection: [NewsViewModel]
    
    var body: some View {
        
        NavigationView {
            
            List(self.newsCollection, id: \.url) {
                news in
                NewsSourceCell(news: news)
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .navigationTitle("Sources")
        }
        

    }
}
