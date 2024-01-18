//
//  NewsViewModel.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [ArticleDto] = []
    private let urlManager: UrlManager = UrlManager()
    
    func fetchNewsAll() async {
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
    
    func fetchNewsForCategory() async {
        do {
            let urlSessionResult = try await URLSession.shared.data(from: urlManager.getUrlForCategory(category: Category.TESLA))
            let data: Data = urlSessionResult.0
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            DispatchQueue.main.async {
                self.articles = newsResponse.articles
            }
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
    
    func fetchNewsTesla() async {
        do {
            let urlSessionResult = try await URLSession.shared.data(from: urlManager.getUrlForCategory(category: Category.TESLA))
            let data: Data = urlSessionResult.0
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            DispatchQueue.main.async {
                self.articles = newsResponse.articles
            }
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
    
    func fetchNewsMicrosoft() async {
        do {
            let urlSessionResult = try await URLSession.shared.data(from: urlManager.getUrlForCategory(category: Category.MICROSOFT))
            let data: Data = urlSessionResult.0
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            DispatchQueue.main.async {
                self.articles = newsResponse.articles
            }
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
    
    func fetchNewsApple() async {
        do {
            let urlSessionResult = try await URLSession.shared.data(from: urlManager.getUrlForCategory(category: Category.APPLE))
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
