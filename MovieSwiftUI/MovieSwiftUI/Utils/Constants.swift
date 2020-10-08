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
	static let youtubeHost = "youtube.com"
	
	static let imageHost = "image.tmdb.org"
	static let imagePath = "/t/p/w500/"
	
	static let path = "/3/movie/"
	static let videoPath = "/videos"
	static let similarPath = "/similar"
	static let youtubePath = "/watch"
	
	static let apiKey = "API_KEY"
	
	static let homeTitle = "Movies"
	static let youtube = "youtube"
}

enum CategoryPath: String, CaseIterable {
	case nowPlaying = "/3/movie/now_playing"
	case popular = "/3/movie/popular"
	case topRated = "/3/movie/top_rated"
	case upcoming = "/3/movie/upcoming"
}

enum SectionTitle: String, CaseIterable {
	case nowPlaying = "Now Playing"
	case popular = "Popular"
	case topRated = "TopRated"
	case upcoming = "Upcoming"
	case similar = "Similar Movies"
}
