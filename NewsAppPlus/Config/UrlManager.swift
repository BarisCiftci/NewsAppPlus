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
    private let categoryUrl = "=alle&from=2023-12-24&to=2023-12-31&sortBy=popularity&apiKey="
    private let categoryUrlTesla = "=tesla&from=2023-12-24&to=2023-12-31&sortBy=popularity&apiKey="
    private let categoryUrlMicrosoft = "=microsoft&from=2023-12-24&to=2023-12-31&sortBy=popularity&apiKey="
    private let categoryUrlaApple = "=apple&from=2023-12-24&to=2023-12-31&sortBy=popularity&apiKey="
    private let key = "e7c00742a71b450b9403d52090fc70ce"
    
    func getUrl() -> URL {
        let url = URL(string: baseUrl+topHeadlinesUrl+categoryUrl+key)!
        return url
    }
    
    func getUrlTesla() -> URL {
        let url = URL(string: baseUrl+topHeadlinesUrl+categoryUrlTesla+key)!
        return url
    }
    
    func getUrlMicrosoft() -> URL {
        let url = URL(string: baseUrl+topHeadlinesUrl+categoryUrlMicrosoft+key)!
        return url
    }
    
    func getUrlApple() -> URL {
        let url = URL(string: baseUrl+topHeadlinesUrl+categoryUrlaApple+key)!
        return url
    }

}
