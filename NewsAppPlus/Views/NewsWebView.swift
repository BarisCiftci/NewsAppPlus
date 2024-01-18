//
//  NewsWebView.swift
//  TestNewsApp
//
//  Created by Baris Ciftci on 03/01/2024.
//

import SwiftUI
import WebKit

struct NewsWebView: UIViewRepresentable {
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
