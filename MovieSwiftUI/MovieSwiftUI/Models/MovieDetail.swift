//
//  MovieDetail.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 07/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

struct MovieVideo: Codable, Hashable {
	let id: Int
	let title: String
	let overview: String
	let releaseDate: String
	let popularity: Double
	let voteCount: Int
	let voteAverage: Double
	let originalLanguage: String
	let originalTitle: String
	let video: Bool
	let adult: Bool
	let genreIds: [Int]
	let posterPath: String?
	let backdropPath: String?
}
