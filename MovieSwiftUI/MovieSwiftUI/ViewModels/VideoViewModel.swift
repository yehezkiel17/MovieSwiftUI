//
//  VideoViewModel.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 08/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

class VideoViewModel: ViewModel, ObservableObject {
	let key: String

	@State var url: URL?
	
	init(key: String) {
		self.key = key
	}
	
	private func createURL() {
		var urlComponent = URLComponents()
		urlComponent.scheme = Constant.scheme
		urlComponent.host = Constant.youtubeHost
		urlComponent.path = Constant.youtubePath
		
		let keyQuery = URLQueryItem(name: "v", value: key)
		urlComponent.queryItems = [keyQuery]
		
		guard let url = urlComponent.url else {
			return
		}
		
		self.url = url
	}
}
