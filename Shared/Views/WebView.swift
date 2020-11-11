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
	
	let viewModel: WebViewModel
	
	init(viewModel: WebViewModel) {
		self.viewModel = viewModel
	}
	
	func makeUIView(context: Context) -> WKWebView {
		let config = WKWebViewConfiguration()
		config.allowsInlineMediaPlayback = true
		
		let webView = WKWebView(frame: viewModel.frame, configuration: config)
		
		let urlRequest = URLRequest(url: viewModel.videoURL)
		webView.load(urlRequest)
		
		return webView
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		
	}
}

