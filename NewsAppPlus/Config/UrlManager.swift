//
//  API.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import Foundation

class UrlManager {
    private let baseUrl = "https://newsapi.org/"
    private let topHeadlinesUrl = "v2/top-headlines?"
    private let categoryUrl = "q=apple&from=2023-12-24&to=2023-12-31&sortBy=popularity&apiKey="
    private let key = "e7c00742a71b450b9403d52090fc70ce"
    
    func getUrl() -> URL {
        let url = URL(string: baseUrl+topHeadlinesUrl+categoryUrl+key)!
        return url
    }
}
