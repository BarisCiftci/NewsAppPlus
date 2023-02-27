//
//  NewsHome.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 12/02/2023.
//

import SwiftUI

struct NewsHome: View {
    
    @ObservedObject private var newsListVM = NewsListViewModel()
    
    init() {
            newsListVM.fetchNews()
        }
        
        var body: some View {
            VStack {
                NewsListView(isFavorite: false, newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
            }
            
        }
    }

