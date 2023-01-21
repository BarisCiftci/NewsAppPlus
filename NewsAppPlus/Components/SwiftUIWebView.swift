//
//  SwiftUIWebView.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 21/01/2023.
//

import Foundation
import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    var urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        {
            guard let url = URL(string: urlString) else {
                return WKWebView()
            }
            
            let request = URLRequest(url: url)
            let webView = WKWebView()
            webView.load(request)
            return webView
        }()
    }
    
    
    
   
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
