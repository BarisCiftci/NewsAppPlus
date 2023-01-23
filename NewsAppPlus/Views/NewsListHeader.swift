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
                    .font(.system(size: 76))
                    .foregroundColor(.pink)
                
                VStack (alignment: .leading) {
                    Text("NewsApp")
                        .fontWeight(.black)
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                    
                    
                    Text("Top Headlines")
                        .fontWeight(.regular)
                    .foregroundColor(.primary)
                }
              
                
                
                Spacer()
            }
            
            
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
