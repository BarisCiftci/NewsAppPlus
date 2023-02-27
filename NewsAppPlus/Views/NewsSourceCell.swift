//
//  NewsSourceCell.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

struct NewsSourceCell: View {
    let news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            Text(news.source)
                .font(.title)
                .fontWeight(.black)
                .lineLimit(1)
                .foregroundColor(.pink)
                
            Text(news.description)
                .font(.headline)
                .padding(.bottom)
                .lineLimit(2)
        }
        
        
    }
}
