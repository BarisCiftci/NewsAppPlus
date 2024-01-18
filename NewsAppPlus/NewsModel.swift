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
    let articles: [ArticleDto]
}

struct Source: Codable {
    let id: String?
    let name: String
}

struct ArticleDto: Codable{
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    // FIXME: Introduce ArticleMapper class, func map(ArticleDto) return Article
    func map() -> Article {
        return Article(
            source: source,
            author: author ?? Constant.UNKNOWN_AUTHOR,
            title: title ?? Constant.UNKNOWN_TITLE,
            description: description ?? Constant.UNKNOWN_DESCRIPTION,
            url: url ?? Constant.UNKNOWN_URL,
            urlToImage: urlToImage ?? Constant.UNKNOWN_URLTOIMAGE,
            publishedAt: publishedAt ?? Constant.UNKNOWN_PUPLISHAT,
            content: content ?? Constant.UNKNOWN_CONTENT
        )
    }
}

struct Article {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}
