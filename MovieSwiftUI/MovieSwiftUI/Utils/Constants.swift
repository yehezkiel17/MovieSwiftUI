//
//  Constants.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 01/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

enum Constant {
	static let scheme = "https"
	static let host = "api.themovie.org"
	static let apiKey = "API_KEY"
}

enum Path: String, CaseIterable {
	case nowPlaying = "/movie/now_playing"
	case upcoming = "/movie/upcoming"
}
