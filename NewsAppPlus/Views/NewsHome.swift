//
//  NewsHome.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

struct NewsHome: View {
    
    @ObservedObject private var newsListVM = NewsListVM()
    
    init() {
        newsListVM.load()
    }
    
    var body: some View {
        VStack {
            NewsListHeader()
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
