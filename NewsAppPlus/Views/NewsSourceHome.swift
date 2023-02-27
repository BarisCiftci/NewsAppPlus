//
//  NewsHome.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

struct NewsSourceHome: View {
    
    @ObservedObject private var newsListVM = NewsListViewModel()
    
    init() {
        newsListVM.fetchNews()
    }
    
    var body: some View {
        VStack {
            NewsSourceListView(newsCollection: self.newsListVM.news)
        }
        .refreshable {
                newsListVM.fetchNews()
        }
        
    }
}

struct NewsSourceHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceHome()
    }
}
