//
//  Category.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 18/01/2024.
//

import Foundation

enum Category: CaseIterable{
    case ALL, APPLE, TESLA, MICROSOFT, SAMSUNG, PEACE
    
    func name() -> String {
        return String(describing: self).capitalized
    }
    
    func categories() -> [Category] {
        return Category.allCases
    }
}
