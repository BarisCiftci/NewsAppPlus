//
//  NewsViewModel.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    func fetchNews() async {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?q=apple&from=2023-12-07&to=2023-12-07&sortBy=popularity&apiKey=e7c00742a71b450b9403d52090fc70ce") 
        else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            DispatchQueue.main.async {
                self.articles = newsResponse.articles
            }
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
}
