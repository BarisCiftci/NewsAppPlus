//
//  NewsSourceHeader.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 27/01/2023.
//

import SwiftUI

struct NewsSourceHeader: View {
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
                    
                    
                    Text("Sources")
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

struct NewsSourceHeader_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceHeader()
    }
}
