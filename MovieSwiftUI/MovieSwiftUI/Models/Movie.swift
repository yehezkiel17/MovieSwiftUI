//
//  Movie.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 01/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

struct Movie: Codable {
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

extension Movie {
	static var dummy: Movie {
		Movie(id: 337401,
			  title: "Mulan",
			  overview: "When the Emperor of China issues a decree that one man per family must serve in the Imperial Chinese Army to defend the country from Huns, Hua Mulan, the eldest daughter of an honored warrior, steps in to take the place of her ailing father. She is spirited, determined and quick on her feet. Disguised as a man by the name of Hua Jun, she is tested every step of the way and must harness her innermost strength and embrace her true potential.",
			  releaseDate: "2020-09-04",
			  popularity: 1139.529,
			  voteCount: 2101,
			  voteAverage: 7.4,
			  originalLanguage: "en",
			  originalTitle: "Mulan",
			  video: false,
			  adult: false,
			  genreIds: [28, 12, 18, 14],
			  posterPath: "/aKx1ARwG55zZ0GpRvU2WrGrCG9o.jpg",
			  backdropPath: "/zzWGRw277MNoCs3zhyG3YmYQsXv.jpg")
	}
}
