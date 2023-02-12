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
    private let usTopHeadline = "top-headlines?country=us"
    
    
    func getNews(completion: @escaping (([News]?) -> Void)) {
        
        // urlString: is the main link to the whole data
        let urlString = [
            "\(baseUrlString)\(usTopHeadline)&category=business&apiKey=\(API.key)",
            "\(baseUrlString)\(usTopHeadline)&category=sport&apiKey=\(API.key)",
            "\(baseUrlString)\(usTopHeadline)&category=health&apiKey=\(API.key)",
            "\(baseUrlString)\(usTopHeadline)&category=science&apiKey=\(API.key)"
        
        ]
        
        guard  let url = URL(string: urlString[1]) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsRes = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsRes == nil ? completion(nil) : completion(newsRes!.articles)
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

