//
//  NewsListHeader.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

struct NewsListHeader: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.primary)
                Text("NewsApp")
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                
                
                Spacer()
            }
            .foregroundColor(.primary)
            .font(.largeTitle)
            
            Text("Top Headlines")
                .foregroundColor(.primary)
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct NewsListHeader_Previews: PreviewProvider {
    static var previews: some View {
        NewsListHeader()
    }
}
