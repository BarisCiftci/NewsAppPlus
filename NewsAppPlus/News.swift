//
//  News.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import Foundation

struct News: Decodable {
    var source: Source
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct Source: Codable {
    var name: String?
}

struct NewsEnvelope: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

