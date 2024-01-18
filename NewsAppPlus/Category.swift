//
//  Category.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 18/01/2024.
//

import Foundation

enum Category {
    case ALL, APPLE, TESLA, MICROSOFT, SAMSUNG
    
    func name() -> String {
        return String(describing: self).capitalized
    }
}
