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
        let urlList = [
            "\(baseUrlString)\(usTopHeadline)sources=techcrunch&apiKey=\(API.key)",
            "\(baseUrlString)\(usTopHeadline)&category=sport&apiKey=\(API.key)",
            "\(baseUrlString)\(usTopHeadline)&category=health&apiKey=\(API.key)",
            "\(baseUrlString)\(usTopHeadline)&category=science&apiKey=\(API.key)"
        ]
        
        let url = URL(string: urlList[0])!
        
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

