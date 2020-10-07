//
//  Movie.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 01/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation

struct Movie: Codable, Hashable {
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
	let videoResponse: MovieVideoResponse?
}

extension Movie {
	private static let dummyOne = Movie(id: 337401,
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
										backdropPath: "/zzWGRw277MNoCs3zhyG3YmYQsXv.jpg",
										videoResponse: nil)
	
	private static let dummyTwo = Movie(id: 605116,
										title: "Project Power",
										overview: "An ex-soldier, a teen and a cop collide in New Orleans as they hunt for the source behind a dangerous new pill that grants users temporary superpowers.",
										releaseDate: "2020-08-14",
										popularity: 635.508,
										voteCount: 1343,
										voteAverage: 6.6,
										originalLanguage: "en",
										originalTitle: "Project Power",
										video: false,
										adult: false,
										genreIds: [28, 80, 878],
										posterPath: "/TnOeov4w0sTtV2gqICqIxVi74V.jpg",
										backdropPath: "/qVygtf2vU15L2yKS4Ke44U4oMdD.jpg",
										videoResponse: nil)
	
	static var dummyMovie: Movie {
		return dummyOne
	}
	
	static var dummyMovies: [Movie] {
		return [dummyOne, dummyTwo]
	}
}
