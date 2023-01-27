//
//  NewsSourceCell.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 27/01/2023.
//

import SwiftUI

struct NewsSourceCell: View {
    let news: NewsViewModel
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
           
            
            Text(news.source)
                .font(.title)
                .fontWeight(.black)
                .lineLimit(3)
                
            Text(news.description)
                .font(.headline)
                .padding(.bottom)
        }
//        .sheet(isPresented: $isPresented) {
//            ContentView()
//        }
//        
//        .onTapGesture{
//            self.isPresented.toggle()
//        }
        
    }
}

