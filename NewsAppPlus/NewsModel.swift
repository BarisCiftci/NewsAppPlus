//
//  NewsModel.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Source: Codable {
    let id: String?
    let name: String
}

struct Article: Codable{
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    func defaultValue() -> DefaultValue {
            return DefaultValue(
                author: "Unknown Author",
                title: "Unknown Title",
                description: "Unknown Description",
                url: "https://media.discordapp.net/attachments/989268324884049960/1061765655889719326/6AC54581-051B-4930-B145-B38B37DAA3DF_1_105_c.jpeg",
                urlToImage: "https://media.discordapp.net/attachments/989268324884049960/1061765655889719326/6AC54581-051B-4930-B145-B38B37DAA3DF_1_105_c.jpeg",
                publishedAt: "Unknown Date",
                content: "Unknown Content",
                sourceName: "Unknown Source"
            )
        }
}

struct DefaultValue {
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    let sourceName: String
}
