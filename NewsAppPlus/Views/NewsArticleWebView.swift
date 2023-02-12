//
//  NewsArticleWebView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 21/01/2023.
//

import SwiftUI

struct NewsArticleWebView: View {
    var newsUrl:String
    @Environment(\.presentationMode) var mode
    var body: some View {
        
        Button {
            mode.wrappedValue.dismiss()
        } label: {
            HStack{
                
                Image(systemName: "xmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                
                Spacer()
            }
            .padding()
        }

        
        SwiftUIWebView(urlString: newsUrl)
            .padding(.top, 20)
    }
}

