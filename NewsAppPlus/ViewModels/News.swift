//
//  NewsViewModel.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import Foundation

struct News: Decodable {
    let author: String
    let title: String
    var source: String
    let description: String
    let url: String
    let urlToImage: String
}
