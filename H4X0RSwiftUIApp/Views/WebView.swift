//
//  WebView.swift
//  H4X0RSwiftUIApp
//
//  Created by Usha Sai Chintha on 11/09/22.
//

import Foundation
import WebKit
import SwiftUI

// below struct helps in having SwiftUIView that represents UIKitView
struct WebView: UIViewRepresentable{
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString{
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
