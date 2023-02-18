//
//  NewsHome.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 12/02/2023.
//

import SwiftUI

struct NewsHome: View {
    
    @ObservedObject private var newsListVM = NewsListVM()
    
    init() {
            newsListVM.load()
        }
        
        var body: some View {
            VStack {
                NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
            }
            
        }
    }

