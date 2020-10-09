//
//  WebView.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 09/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
	var videoURL: URL
	var frame: CGRect
	
	func makeUIView(context: Context) -> WKWebView {
		let config = WKWebViewConfiguration()
		config.allowsInlineMediaPlayback = true
		
		let webView = WKWebView(frame: frame, configuration: config)
		
		let urlRequest = URLRequest(url: videoURL)
		webView.load(urlRequest)
		
		return webView
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		
	}
}

