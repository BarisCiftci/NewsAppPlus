//
//  NewsListVM.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var news = [News]()
    @Published var imageData = [String: Data]()
    
    private let networkManager = NetworkManager()
    private let newsMapper = NewsMapper()
    
    func fetchNews(){
        networkManager.getNews { (newsDtoList) in
            if newsDtoList == nil { return }
            
            let newsList = self.newsMapper.convert(newsDtoList: newsDtoList!)
            self.getImages(for: newsList)
            
            DispatchQueue.main.async {
                self.news = newsList
            }
        }
    }
    
    private func getImages(for news: [News]) {
        
        news.forEach { n in
            guard !n.urlToImage.isEmpty else { return }
            
            networkManager.getImage(urlString: n.urlToImage) { (data) in
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    self.imageData[n.urlToImage] = data
                }
            }
        }
    }
}
