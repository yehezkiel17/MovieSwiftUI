//
//  CardCollectionViewModel.swift
//  MovieSwiftUI
//
//  Created by Yehezkiel Litbagay on 05/10/20.
//  Copyright © 2020 kiel. All rights reserved.
//

import Foundation
import SwiftUI

class CardCollectionViewModel: ViewModel, ObservableObject {
	
	let title: SectionTitle
	let cardOrientationType: CardOrientationType
	let movieSession = MovieSession.shared
	let movieCache = MovieCache.shared
	
	@Published var movies: [Movie] = [Movie.dummyMovie]
	
	init(title: SectionTitle,
		 cardOrientationType: CardOrientationType,
		 movieId: String? = nil) {
		self.title = title
		self.cardOrientationType = cardOrientationType
		
		getMovie(id: movieId)
		requestMovie(id: movieId)
	}
	
	func getMovie(id: String? = nil) {
		var key: String
		
		switch title {
		case .nowPlaying:
			key = MovieCache.MovieKey.nowPlaying.rawValue
		case .popular:
			key = MovieCache.MovieKey.popular.rawValue
		case .topRated:
			key = MovieCache.MovieKey.topRated.rawValue
		case .upcoming:
			key = MovieCache.MovieKey.upcoming.rawValue
		case .similar:
			key = (MovieCache.MovieKey.similar.rawValue + (id ?? "0"))
		}
		
		guard let movies = movieCache.load(key: key) else {
			requestMovie()
			return
		}
		
		DispatchQueue.main.async { [weak self] in
			self?.movies = movies
		}
	}
	
	func requestMovie(id: String? = nil) {
		var path: CategoryPath?
		
		switch title {
		case .nowPlaying:
			path = .nowPlaying
		case .popular:
			path = .popular
		case .topRated:
			path = .topRated
		case .upcoming:
			path = .upcoming
		case .similar:
			guard let id = id else {
				return
			}
			
			requestSimilarMovies(id: id)
			break
		}
		
		guard let categoryPath = path else {
			return
		}
		
		movieSession.getMovies(path: categoryPath, successCompletion: { [weak self] response in
			guard let self = self else {
				return
			}
			
			self.movies = response.results
		})
	}
	
	func requestSimilarMovies(id: String) {
		movieSession.getSimilarMovies(id: id, successCompletion: { [weak self] response in
			guard let self = self else {
				return
			}
			
			self.movies = response.results
		})
	}
	
	func getWidth() -> CGFloat {
		switch cardOrientationType {
		case .landscape:
			return 256
		case .portrait:
			return 160
		}
	}
	
	func getHeight() -> CGFloat {
		switch cardOrientationType {
		case .landscape:
			return 176
		case .portrait:
			return 280
		}
	}
	
	func getLeadingPadding(movie: Movie) -> CGFloat {
		let firstId = self.movies.first?.id ?? 0
		let padding: CGFloat = movie.id == firstId ? 0 : 8
		return padding
	}
	
	func getTrailingPadding(movie: Movie) -> CGFloat {
		let lastId = self.movies.last?.id ?? 0
		let padding: CGFloat = movie.id == lastId ? 0 : 8
		return padding
	}
}
