//
//  NewsArticleWebView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 21/01/2023.
//

import SwiftUI

struct NewsArticleWebView: View {
    var newsUrl:String
    
    var body: some View {
        SwiftUIWebView(urlString: newsUrl)
            .padding(.top, 20)
    }
}

