//
//  NetworkManager.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import Foundation

// Creating Network layer
class NetworkManager {
    private let baseUrlString = "https://newsapi.org/v2/"
    private let usTopHeadline = "top-headlines?"
    
    func getNews(completion: @escaping (([NewsDto]?) -> Void)) {
        
        // urlString: is the main link to the whole data
        //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY
       
        let url = URL(string: "\(baseUrlString)\(usTopHeadline)q=apple&from=2023-12-07&to=2023-12-07&sortBy=popularity&apiKey=\(API.key)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsResponse = try? JSONDecoder().decode(NewsResponse.self, from: data)
            newsResponse == nil ? completion(nil) : completion(newsResponse!.articles)
        }.resume()
        
    }
        func getImage(urlString: String, completion : @escaping (Data?) -> Void) {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                completion(data)
            }.resume()
        }
    }

