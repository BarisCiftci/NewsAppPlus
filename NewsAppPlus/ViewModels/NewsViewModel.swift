//
//  NewsViewModel.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private let urlManager: UrlManager = UrlManager()
    
    func fetchNews() async {
        do {
            let urlSessionResult = try await URLSession.shared.data(from: urlManager.getUrl())
            let data: Data = urlSessionResult.0
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            DispatchQueue.main.async {
                self.articles = newsResponse.articles
            }
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
}
