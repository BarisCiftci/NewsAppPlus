//
//  NewsMapper.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 27/02/2023.
//

import Foundation
import SwiftUI

class NewsMapper {
    func convert(newsDtoList: [NewsDto]) -> [News] {
        var newsList: [News] = []
        newsDtoList.forEach { newsDto in
            let news = map(newsDto: newsDto)
            newsList.append(news)
        }
        
        return newsList
    }
    
    private func map(newsDto: NewsDto) -> News {
        let news = News(
            author: newsDto.author ?? "Unknown",
            title: newsDto.title ?? "Unknown",
            source: newsDto.source.name ?? "Unknown",
            description: newsDto.description ?? "Unknown",
            url: newsDto.url ?? "Unknown",
            urlToImage: newsDto.urlToImage ?? "https://media.discordapp.net/attachments/989268324884049960/1061765655889719326/6AC54581-051B-4930-B145-B38B37DAA3DF_1_105_c.jpeg")
    
        return news
    }
     
}
