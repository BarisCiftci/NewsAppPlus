//
//  NewsViewModel.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import Foundation

struct NewsViewModel{
    let news: News
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var description: String {
        return news.description ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? "Unknown"
    }
    
    var url: String {
        return news.url ?? "Unknown"
    }
    
    var source: String {
        return news.source.name  ?? "Unknown"
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://media.discordapp.net/attachments/989268324884049960/1061765655889719326/6AC54581-051B-4930-B145-B38B37DAA3DF_1_105_c.jpeg"
    }
}
