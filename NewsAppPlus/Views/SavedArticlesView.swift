//
//  SavedArticlesView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 01/02/2024.
//

import SwiftUI

struct SavedArticlesView: View {
    @State private var favoriteArticles: [String] = UserDefaults.standard.stringArray(forKey: "favoriteArticles") ?? []
    
    var body: some View {
        
        
        List {
            
            ForEach(favoriteArticles, id: \.self) { articleUrl in
                NavigationLink(destination: NewsWebView(urlString: articleUrl)) {
                    Text(articleUrl)
                }
                
            }
            .onDelete(perform: deleteArticle)
        }
        .navigationTitle("Saved Articles")
        .navigationBarItems(trailing: EditButton())
    }
    
    func deleteArticle(at offsets: IndexSet) {
        favoriteArticles.remove(atOffsets: offsets)
        UserDefaults.standard.set(favoriteArticles, forKey: "favoriteArticles")
    }
}

