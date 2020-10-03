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
	static let host = "api.themoviedb.org"
	
	static let imageHost = "image.tmdb.org"
	static let imagePath = "/t/p/original/"
	
	static let apiKey = "API_KEY"
}

enum Path: String, CaseIterable {
	case nowPlaying = "/3/movie/now_playing"
	case upcoming = "/3/movie/upcoming"
}
