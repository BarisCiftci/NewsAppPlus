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
    private let dateFrom = "2024-01-01"
    private let dateTo = "2024-01-19"
    
    func getUrlForCategory(category: Category) -> URL {
        let categoryName = category.name().lowercased()
        let categoryUrl = String("=\(categoryName)&from=\(dateFrom)&to=\(dateTo)&sortBy=popularity&apiKey=")
        let generatedUrl = baseUrl+topHeadlinesUrl+categoryUrl+key
        return URL(string: generatedUrl)!
    }
}
