//
//  API.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import Foundation

class UrlManager {
    private let baseUrl = "https://newsapi.org/"
    private let topHeadlinesUrl = "v2/top-headlines?q"
    private let key = "e7c00742a71b450b9403d52090fc70ce"
    
    func getUrlForCategory(category: Category) -> URL {
        let categoryName = category.name().lowercased()
        let categoryUrl = String("=\(categoryName)&from=2023-12-24&to=2023-12-31&sortBy=popularity&apiKey=")
        let generatedUrl = baseUrl+topHeadlinesUrl+categoryUrl+key
        return URL(string: generatedUrl)!
    }
}
